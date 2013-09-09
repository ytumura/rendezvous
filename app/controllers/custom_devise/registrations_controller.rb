class CustomDevise::RegistrationsController < Devise::RegistrationsController
  before_action :update_permitted_parameters, if: :devise_controller?

  def update_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :name) }
  end
  protected :update_permitted_parameters

  def update
    begin
      super
    rescue ActiveRecord::RecordNotUnique
      redirect_to edit_user_registration_path
    end
  end
end
