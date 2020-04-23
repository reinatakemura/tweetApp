class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_inactive_sign_up_path_for(resource)
  #   flash[:notice] = "サインアップに成功しました"
  #   user_path(current_user.id)
  # end

  def after_sign_in_path_for(resource) 
    flash[:notice] = "ログインに成功しました"
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def forbit_login_user
    if current_user
      flash[:notice] = "すでにログインしています"
      redirect_to posts_path
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image_name])
    end

end
