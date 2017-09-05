Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :strava, ENV['STRAVA_CLIENT_ID'], ENV['STRAVA_CLIENT_SECRET'], scope: 'public'

  provider :google, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']


  #provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
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
