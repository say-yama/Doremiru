class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
      redirect_to post_path(post)
    else
      flash[:notice] = "エラーが発生しました。"
      redirect_to post_path(post)
    end
  end

  def edit
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    post = Post.find(params[:post_id])
    redirect_to post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end
