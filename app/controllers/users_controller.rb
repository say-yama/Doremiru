class UsersController < ApplicationController
 before_action :set_user, only: [:favorites]
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    # if @posts.nil?
    #   "投稿はまだありません"
    # end
  end

  def edit
    @user = current_user
    @profile = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def withdrawal
      @user = current_user
  end

  def deleted
    @user = User.find(params[:id])
    if
      @user.update(status: 1)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    else
      flash[:notice] = "退会処理に失敗いたしました"
      redirect_to user_path
    end
  end


private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:profile, :image)
  end
end

