# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end


  def after_sign_in_path_for(resource)
    root_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
  
end
