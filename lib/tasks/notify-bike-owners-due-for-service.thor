class Bikes < Thor

  desc "notify_bike_owners", "Send an email to thos who need their bike on service."

  def notify_bike_owners
    puts "Loading Rails environment..."
    require File.expand_path('config/environment.rb')

    @bikes_due_for_service = Bike.all.map { |b| b if (b.parts_due_for_service.size > 0) }

    puts "These bikes are due for service: #{@bikes_due_for_service}"

    @bikes_due_for_service.each do |bike|
      owner = bike.user
      NotificationMailer.bike_due(owner, bike).deliver_later
    end

  end

end
