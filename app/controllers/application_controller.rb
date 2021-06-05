class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end

  def after_sign_in_path_for(resource)
    admin_posts_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path # ログアウト後に遷移するpathを設定
  end

end
