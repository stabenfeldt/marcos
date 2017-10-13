class NotificationMailer < ApplicationMailer

  def bike_due(bike:, user:)
    @bike = bike
    @user = user
    @url  = user_bike_url(@user, @bike)
    mail(to: @user.email, subject: "#{@bike.name.capitalize} needs service")
  end

end
