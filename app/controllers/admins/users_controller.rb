class Admins::UsersController < ApplicationController
  before_action :authenticate_admin

  def index
    @users = User.all.order(created_at: :DESC)
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to admins_user_path(user)
    else
      flash[:notice] = "編集に失敗しました。"
      redirect_to admins_user_path(user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :status, :created_at)
  end
end
