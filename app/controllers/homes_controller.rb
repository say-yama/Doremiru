class HomesController < ApplicationController
  def top
   @posts = Post.all.order(created_at: :desc)
   @ranks = Post.group('title').order('count_all DESC').count
  # 開発環境下
  @book_ranks = Post.group('title').having('category_id = 1').order('count_all DESC').count
  @comic_ranks = Post.group('title').having('category_id = 2').order('count_all DESC').count
  #
  # 本番環境下
    # @book_ranks = Post.joins(:category).group(:title).having('count(*) = ?', 1).count
    # @comic_ranks = Post.joins(:category).group(:title).having('count(*) = ?', 2).count
  #
  end

  def about
  end
end

private
