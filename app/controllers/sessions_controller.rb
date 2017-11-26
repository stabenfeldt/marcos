class SessionsController < Devise::SessionsController

  def create
    # First receive the user code from Strava
    code = auth_params["authenticity_token"]
    Rails.logger.debug "params: #{params}"
    #code = auth_params["code"]
    user = User.from_strava_omniauth(code)
    session[:user_id] = user.id
    redirect_to user, notice: "Velkommen #{user.first_name}"
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected


  def auth_hash
    Rails.logger.debug "AUTH HASH: "
    Rails.logger.debug request.env['omniauth.auth']
    request.env['omniauth.auth']
  end

  def auth_params
    params.permit(
      "authenticity_token",
      "code",
      "commit",
      "oauth_token",
      "oauth_verifier",
      "provider",
      "state",
      "user",
      "utf8",
    )
  end

end
