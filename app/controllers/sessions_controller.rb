class SessionsController < Devise::SessionsController
  def create
    Rails.logger.debug "create 1=================="
    # First receive the user code from Strava
    code = auth_params["code"]
    user = User.from_strava_omniauth(code)
    session[:user_id] = user.id
    redirect_to user, notice: "Velkommen #{user.first_name}"
  end

  def logout
    Rails.logger.debug "LOGOUT=================="
    reset_session
    redirect_to root_url, notice: "You're logged out"
  end

  protected


  def auth_hash
    Rails.logger.debug "AUTH HASH: "
    Rails.logger.debug request.env['omniauth.auth']
    request.env['omniauth.auth']
  end

  def auth_params
    params.permit("provider", "state", "code", "oauth_token", "oauth_verifier")
  end

end
