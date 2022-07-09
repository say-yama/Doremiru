class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path
  end

  def index
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def search
  end
end
  
private
  def post_params
    params.require(:post).permit(:category_id, :gunre_id, :title, :post_title, :post_body, :rate, )
  end
