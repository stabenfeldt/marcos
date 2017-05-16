class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception


  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  def admin?
    return unless signed_in?
    current_user.role == 'admin'
  end

  helper_method :current_user, :signed_in?, :admin?

end
