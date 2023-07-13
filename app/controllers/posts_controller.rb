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
    @current_user = current_user
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @post = @user.posts.includes(:author, :comments, :likes).find(params[:id])
    else
      @post = Post.includes(:author, :comments, :likes).find(params[:id])
      @user = @post.author
    end
    @comment = @post.comments

    @current_user = current_user
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Post not found.'
    redirect_to root_path
  end
  def new
    @current_user = current_user
    @post = @current_user.posts.new
  end
  def create
    @current_user = current_user
    @post = current_user.posts.new(post_params.merge(comments_counter: 0, likes_counter: 0))
    if @post.save
      redirect_to user_post_url(@current_user, @post)
    else
      render :new
    end
  end
  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
  
end
