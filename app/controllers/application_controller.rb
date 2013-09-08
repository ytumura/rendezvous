class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_login, :check_user_name
  before_action :update_permitted_parameters, if: :devise_controller?

  def check_login
    if not current_user and not params[:controller].include?('devise')
      redirect_to new_user_session_path
    end
  end

  def check_user_name
    return if params[:controller] == 'devise/registrations'
    if current_user and current_user.name.blank?
      redirect_to edit_user_registration_path
    end
  end

  def update_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :name) }
  end
  protected :update_permitted_parameters
end
