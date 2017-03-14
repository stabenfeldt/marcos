Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  #provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :strava, ENV['STRAVA_CLIENT_ID'], ENV['STRAVA_CLIENT_SECRET'], scope: 'public'


  #provider :twitter, "API_KEY", "API_SECRET",
  #  {
  #    :secure_image_url => 'true',
  #    :image_size => 'original',
  #    :authorize_params => {
  #      :force_login => 'true',
  #      :lang => 'pt'
  #    }
  #  }

end
