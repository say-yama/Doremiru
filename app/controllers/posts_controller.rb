class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post)
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

  def destroy
    post =Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def search
    @search_posts = Post.search(params)
  end

end

private
  def post_params
    params.require(:post).permit(:category_id, :genre_id, :title, :post_title, :post_body, :rate, )
  end
  
  def search
    params.permit(:title, :category_id, :genre_id)
  end
