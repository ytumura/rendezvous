class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_login, :check_user_name

  def check_login
    if not current_user and not params[:controller].include?('devise')
      redirect_to new_user_session_path
    end
  end

  def check_user_name
    return if params[:controller] == 'custom_devise/registrations'
    if current_user and current_user.name.blank?
      redirect_to edit_user_registration_path
    end
  end
end
