class PostsController < ApplicationController

  def new
    @post = Post.new
    @book = Book.find(params[:isbn])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post)
  # else
  #   redirect_to books_search_path
  # end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(params[:id])
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
    params.require(:post).permit(:book_isbn, :category_id, :genre_id, :post_title, :post_body, :rate, )
  end

  def search
    params.permit(:title, :category_id, :genre_id)
  end

  def read(result)
    title = result["title"]
    author = result["author"]
    url = result["itemUrl"]
    isbn = result["isbn"]
    image_url = result["mediumImageUrl"].gsub('?_ex=120x120', '')
    book_genre_id = result["booksGenreId"]
    item_caption = result["itemCaption"]
    {
      title: title,
      author: author,
      url: url,
      isbn: isbn,
      image_url: image_url,
      book_genre_id: book_genre_id,
      item_caption: item_caption
    }
  end
