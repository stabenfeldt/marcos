class Bikes < Thor

  desc "notify_bike_owners", "Send an email to thos who need their bike on service."

  def notify_bike_owners
    puts "Loading Rails environment..."
    require File.expand_path('config/environment.rb')

    User.all.each do |u|
      u.fetch_bikes_from_strava
    end
  end

end
