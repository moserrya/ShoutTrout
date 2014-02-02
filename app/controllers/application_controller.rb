class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :sign_out_user

  def sign_out_user
    sign_out current_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :phone_number << {contact_attributes: [:phone_number]}
    devise_parameter_sanitizer.for(:edit) {|u| u.permit(:name, :email, :phone_number, :password, :password_confirmation, :time_zone, :contact_attributes => [:name, :phone_number])}
  end
end
