# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  protected

  def after_sign_in_path_for(resource)
      admin_users_path
  end

  #記述しない場合.comに指定したページに遷移する
  # def after_sign_out_path_for(resource)
  #   admin_path
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute_to_permit])
  end
end
  
