class PostsController < ApplicationController
  def index
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @posts = Post.includes(:author, :comments).where(author_id: params[:user_id])
    else
      @posts = Post.includes(:author, :comments).all
    end
  end

  def show
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @post = @user.posts.includes(:author, :comments, :likes).find(params[:id])
    else
      @post = Post.includes(:author, :comments, :likes).find(params[:id])
      @user = @post.author
    end

    @current_user = current_user
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Post not found.'
    redirect_to root_path
  end
end
