class UsersController < ApplicationController
  before_action :set_user, only: [:favorites]
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(5) #新着順
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if user.update(user_params)
      sleep(3) # S3への画像反映のタイムラグを考慮して3秒待機
      redirect_to user_path(user.id)
    else
      flash[:notice] = "編集に失敗しました。文字数は50文字までにしてください"
      redirect_to edit_user_path(current_user)
    end
  end

  def favorites
    # いいねした投稿
    favorites = Favorite.where(user_id: @user.id).order(created_at: :desc).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    @favorite_posts = Kaminari.paginate_array(@favorite_posts).page(params[:page]).per(5)
  end

  def withdrawal
    @user = current_user
  end

  def deleted
    @user = User.find(params[:id])
    if @user.update(status: 1)
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
