class HomesController < ApplicationController
  def top
   @posts = Post.all
   @ranks = Post.group("title").order("count_all DESC").count
   @movie_ranks = Post.group("title").having("category_id == 1").order("count_all DESC").count
   @book_ranks = Post.group("title").having("category_id == 2").order("count_all DESC").count
   @comic_ranks = Post.group("title").having("category_id == 3").order("count_all DESC").count
  end

  def about
  end
end

private
