if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['STABENFELDT_AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['STABENFELDT_SECRET_ACCESS_KEY'],
      :region                 => 'eu-west-1',
    }
    config.fog_directory  = ENV['S3_BUCKET']   #  same as bucket name. required
    config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end

end
