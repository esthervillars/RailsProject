class CommentsController < ApplicationController
	before_filter :load_commentable
	

	def index
		@comments = @commentable.comments
	end

	#used in blog and for leaving product reviews
	def create
		
		@comment = @commentable.comments.new(comment_params.merge(user_id: current_user.id))
		
		respond_to do |format|
			if @comment.save
				format.html { redirect_to @commentable, notice: 'Created successfully.' }
				format.json { render :show, status: :created, location: @commentable }
			else
				format.html { redirect_to @commentable, alert: 'Not saved successfully.' }
				format.json { render json: @commentable.errors, status: :unprocessable_entity }
			end
		end

		
	end

	# DELETE
	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to @commentable
	end

	private

		def load_commentable
			#finds params by taking path and grabbing second and third element out of array
			resource, id = request.path.split('/')[1, 2]
			@commentable = resource.singularize.classify.constantize.find(id) #eg Post/1 path uses Post.find(1)
			
		end

		def comment_params
     params.require(:comment).permit(:body, :rating)
    end
end
