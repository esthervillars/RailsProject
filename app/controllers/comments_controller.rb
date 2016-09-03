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


  def edit
  end

	def update
		@comment = Comment.find(params[:id])
    
		respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @commentable, notice: 'Comment was successfully reported as abusive.' }
        format.json { render :show, status: :ok, location: @commentable }
      else
        format.html { render :edit }
        format.json { render json: @commentable.errors, status: :unprocessable_entity }
      end
    end

  end

  def report_comment
    @report = params[:report]
		@user_id = params[:user_id]
		@message = params[:body]
		UserMailer.report_abuse(@report, @user_id, @message).deliver_now
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
     params.require(:comment).permit(:body, :rating, :report)
    end
end
