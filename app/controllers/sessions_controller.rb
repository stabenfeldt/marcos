class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(auth_params)
    session[:user_id] = user.id
    redirect_to root_url, notice: "Welcome"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def auth_params
    params.permit(:provider)
    params.permit(:uid)
    params.permit(:info)
  end

end
