class NotificationMailer < ApplicationMailer

  def bike_due(bike:, owner:)
    @bike = bike
    @owner = owner
    @url  = 'http://example.com/login'
    mail(to: @owner.email, subject: "Your bike #{@bike.name} needs service")
  end

end
