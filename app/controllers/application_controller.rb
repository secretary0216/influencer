class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  # def after_sign_in_path_for(resources)
  #   edit_user_registration_path
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduce, :tag_list, :twitter_account, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :introduce, :tag_list, :twitter_account, :image])
    end
end
