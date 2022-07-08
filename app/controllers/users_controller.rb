class UsersController < ApplicationController
  def show
    @user = current_user
    @posts = @user.posts
  end

  def edit
  end

  def update
  end

  def likes
  end

  def check
  end

  def withdrawal
  end
  
  
  
  
  private
   def user_params
    params.require(:user).permit(:neme, :profile, :email, :password, :image, :status)  
   end
  
end
