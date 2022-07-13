class UsersController < ApplicationController
 before_action :set_user, only: [:favorites]
  def show
    @user = current_user
    @posts = @user.posts
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

