module BikesHelper

  include ActionView::Helpers::NumberHelper


  def km_until_next_service(bike_part)
    km_until_next = bike_part.km_until_next_service

    if bike_part.in_for_service?
      return "Til service nå"
    end

    if km_until_next == 0
      return "Nå"
    elsif (km_until_next < 0)
      return " #{number_to_human(km_until_next, unit: :distance)} kilometer siden"
    elsif (km_until_next > 0)
      return "Om #{number_to_human(km_until_next, unit: :distance)} kilometer"
    end

  end
end
