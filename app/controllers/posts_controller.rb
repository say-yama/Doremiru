class PostsController < ApplicationController
  def new
    @post = Post.new
    @book = Book.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      flash[:notice] = "エラーが発生しました"
      redirect_to books_search_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post_path(params[:id])
    else
      flash[:notice] = "エラーが発生しました"
      redirect_to post_path(params[:id])
    end
  end

  def destroy
    post =Post.find(params[:id])
    if post.destroy
      redirect_to root_path
    else
      flash[:notice] = "エラーが発生しました"
      redirect_to post_path(params[:id])
    end
  end

  def search
    @search_posts = Post.search(params)
  end

end

private
  def post_params
    params.require(:post).permit(:book_id, :category_id, :genre_id, :title, :post_title, :post_body, :rate, )
  end

  def search
    params.permit(:title, :category_id, :genre_id)
  end
