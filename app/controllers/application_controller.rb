class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # 管理者と会員がどちらもログインしてなかったら
  before_action :authenticate_user!, except: [:top, :about, :search, :show], unless: :admin_signed_in?
  
  # 管理者ログインせずに管理人ページにアクセスした時
  def authenticate_admin
    redirect_to new_admin_session_url unless admin_signed_in?
  end
  
  protected
  
  #新規登録ログイン後のリダイレクト
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました" 
      root_url
    else
      flash[:notice] = "新規登録完了しました。" 
      user_path(resource)  
    end
  end
  
  def after_sign_out_path_for(resource)
    root_url
  end
  
  #新規登録/編集時にアカウント名を追加する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end
  
end
