class Bikes < Thor

  desc "notify_bike_owners", "Send an email to thos who need their bike on service."

  def notify_bike_owners
    puts "Loading Rails environment..."
    require File.expand_path('config/environment.rb')

    @bikes_due_for_service = Bike.due_for_service

    puts "These bikes are due for service: #{@bikes_due_for_service}"

    @bikes_due_for_service.each do |bike|
      NotificationMailer.bike_due(bike: bike, user: bike.user).deliver_later
    end

  end

end
