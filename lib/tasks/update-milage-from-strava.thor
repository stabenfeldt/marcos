class Bikes < Thor

  desc "update_distance", "Update distance for all bikes from strava"

  def update_distance
    puts "Loading Rails environment..."
    require File.expand_path('config/environment.rb')

    User.all.each do |u|
      u.fetch_bikes_from_strava
    end
  end

end
