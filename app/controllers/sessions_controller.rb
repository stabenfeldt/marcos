class SessionsController < ApplicationController
  def create
    # First receive the user code from Strava
    code = auth_params["code"]
    user_data = fetch_user_data(code)
    user = User.from_strava_omniauth(user_data)
    session[:user_id] = user.id
    redirect_to root_url, notice: "Welcome"
  end

  protected

  # $ curl -X POST https://www.strava.com/oauth/token \
  #   -F client_id=5 \
  #   -F client_secret=7b2946535949ae70f015d696d8ac602830ece412 \
  #   -F code=75e251e3ff8fff

	def fetch_user_data(code)
    client_id     = ENV["STRAVA_CLIENT_ID"]
    client_secret = ENV["STRAVA_CLIENT_SECRET"]
    HTTParty.post( "https://www.strava.com/oauth/token?" + "client_id=#{client_id}" + "&client_secret=#{client_secret}" + "&code=#{code}")
	end

  def auth_hash
    Rails.logger.debug "AUTH HASH: "
    Rails.logger.debug request.env['omniauth.auth']
    request.env['omniauth.auth']
  end

  def auth_params
    params.permit("provider", "state", "code", "oauth_token", "oauth_verifier")
  end

end
