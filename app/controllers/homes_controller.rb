class HomesController < ApplicationController
  def top
   @posts = Post.all
   @ranks = Post.group("title").order("count_all DESC").count
   @movie_ranks = Post.having("category_id == 1").group("title").order("count_all DESC").count
   @book_ranks = Post.having("category_id == 2").group("title").order("count_all DESC").count
   @comic_ranks = Post.having("category_id == 3").group("title").order("count_all DESC").count
  end

  def about
  end
end

private
