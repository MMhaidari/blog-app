class PostsController < ApplicationController
  def index
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @posts = @user.posts
    else
      @posts = Post.all
    end
  end

  def show
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:id])
    else
      @post = Post.find(params[:id])
      @user = @post.author
    end

    @current_user = current_user

    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Post not found.'
      redirect_to root_path
  end
  
end
