class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
      if @post.save
    redirect_to @post
    flash[:notice]  = "post created!"
      else
    redirect_back(fallback_location: root_path)
    flash[:alert] = "post creation failed!"
      end
  end

  def edit
    @post = Post.find(params[:id])
    if current_user != @post.user
      sign_out current_user
      redirect_to(root_path)
      flash[:notice] = "Unauthorized request"
    end
  end
  def update
      @post = Post.find(params[:id])
      if current_user == @post.user
        @post.update(post_params)
      redirect_to @post
      flash[:notice] = "Post updated"
     else
       redirect_back(fallback_location: root_path)
       flash[:notice] = "not authorised to edit post"
     end
  end
  def destroy
	   post = Post.find(params[:id])
     if current_user == post.user
       post.destroy
     redirect_to "/posts"
     flash[:notice] = "Post destroyed"
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "not authorised to delete post"
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :pic, :content)
    end
end
