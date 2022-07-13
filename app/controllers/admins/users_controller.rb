class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

private
  def user_params
    params.require(:user).permit(:id, :name, :status, :created_at)
  end

end
