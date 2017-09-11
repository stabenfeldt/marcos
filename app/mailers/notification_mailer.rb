class NotificationMailer < ApplicationMailer

  def bike_due(bike:, owner:)
    @bike = bike
    @owner = owner
    @url  = 'http://example.com/login'
    mail(to: @owner.email, subject: "#{@bike.name.capitalize} needs service")
  end

end
