class HomesController < ApplicationController
  def top
    # 新着順
    @posts = Post.all.order(created_at: :desc).page(params[:page])
    @books = Post.books.order(created_at: :desc).page(params[:book_params])
    @comics = Post.comics.order(created_at: :desc).page(params[:comic_params])

    # タイトルでの投稿数ランキング
    @ranks = Book.find(Post.group(:book_id).order('count(book_id) desc').limit(3).pluck(:book_id))
    @book_ranks = Book.find(Post.books.group(:book_id).order('count(book_id) desc').limit(3).pluck(:book_id))
    @comic_ranks = Book.find(Post.comics.group(:book_id).order('count(book_id) desc').limit(3).pluck(:book_id))
  end

  def about
  end
end

private
