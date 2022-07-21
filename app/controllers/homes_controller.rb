class HomesController < ApplicationController
  def top
   @posts = Post.all.order(created_at: :desc)
   @ranks = Post.group('title').order('count_all DESC').count
  # 開発環境下
   @book_ranks = Post.books.group('title').order('count_all DESC').count
   @comic_ranks = Post.comics.group('title').order('count_all DESC').count
  #
  end

  def about
  end
end

private
