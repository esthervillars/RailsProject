class PostsController < ApplicationController

	before_filter :authenticate_user!

	# Not using callbacks in this controller for demonstration, see @post = Post.find(params[:id]) repeated in each action
	
	def index

		if params[:q]
      search_term = params[:q]
      if Rails.env.development?
        @posts = Post.where("title LIKE ?", "%#{search_term}%").paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
      else
        @posts = Post.where("title ilike ?", "%#{search_term}%").paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
      end
    else
			@posts = Post.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
		end
	end

	def show
		@post = Post.find(params[:id])
		@commentable = @post
		@comments = @commentable.comments.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
		
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
		
		respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
      	#render instead of redirect here preserves content whereas redirect causes refresh - thus content is kept in forms until validated
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
		@post = Post.find(params[:id])
		
		respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post}
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

	end

	def destroy
		@post = Post.find(params[:id])

		@post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
	end

	private
		def post_params
			params.require(:post).permit(:title, :body, :img_url)
		end
end
