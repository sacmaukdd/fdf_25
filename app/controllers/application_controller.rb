class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit :username, :email, :password, :password_confirmation,
        :phone, :address, :avatar
    end

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit :username, :email, :password, :password_confirmation,
        :current_password, :phone, :address, :avatar
    end
  end
end
