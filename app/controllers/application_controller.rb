class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] ||
    stored_location_for(resource) ||
    @current_user
  end


  protect_from_forgery with: :null_session,
    only: Proc.new { |c| c.request.format.json? },
    prepend: true

  def signed_in?
    current_user.present?
  end

  def admin?
    return unless signed_in?
    current_user.role == 'admin'
  end

  helper_method :current_user, :signed_in?, :admin?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end
