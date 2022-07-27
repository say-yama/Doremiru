class HomesController < ApplicationController
  def top
    # 新着順
    @posts = Post.all.order(created_at: :desc).page(params[:page])
    @books = Post.books.order(created_at: :desc).page(params[:book_params])
    @comics = Post.comics.order(created_at: :desc).page(params[:comic_params])

    # タイトルでの投稿数ランキング
    @ranks = Post.group('title').order('count_all DESC').count
    @book_ranks = Post.books.group('title').order('count_all DESC').count
    @comic_ranks = Post.comics.group('title').order('count_all DESC').count
  end

  def about
  end
end

private
