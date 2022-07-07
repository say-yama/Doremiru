class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  #新規登録ログイン後のリダイレクト
  def after_sign_in_path_for(resource)
    if current_users_user
      flash[:notice] = "ログインに成功しました" 
      root_url  
    else
      flash[:notice] = "新規登録完了しました。" 
      user_path  
    end
  end
  
  #新規登録時にアカウント名を追加する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
