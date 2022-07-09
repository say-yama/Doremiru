class UsersController < ApplicationController
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

  def likes
  end

  def check
  end

  def withdrawal
  end




  private
   def user_params
    params.require(:user).permit(:profile, :image)
   end

end
