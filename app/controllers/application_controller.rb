class ApplicationController < ActionController::Base
  # ログインが成功していないとtopページ以外は表示できないようにする
  # 強制的にログイン画面にリダイレクト
  before_action :authenticate_user!, except: [:top]
  # privateのやつと同じ？
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # サインイン後にどこに行くかを決める.after_sign_in_path_for(resource)これはdevise特有のやーつ
  # 新規登録からでもログインからでも行ける
  
  def after_sign_in_path_for(resource)
    # about_path
    post_images_path
  end
  
  def after_sign_out_path_for(resource)
    # about_path
    root_path
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
