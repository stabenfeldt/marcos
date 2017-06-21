module BikesHelper

  include ActionView::Helpers::NumberHelper


  def km_until_next_service(bike_part)
    km_until_next = bike_part.km_until_next_service

    if bike_part.in_for_service?
      return ["Til service nå", :service_now]
    end

    if km_until_next == 0
      return ["Nå", :now]
    elsif (km_until_next < 0)
      return [" #{number_to_human( -1* km_until_next/100, unit: :distance, precision: 0)} kilometer siden", :over]
      #return [" #{km_until_next/100} kilometer siden", :over]
    elsif (km_until_next > 0)
      return ["Om #{number_to_human(km_until_next/100, unit: :distance)} kilometer", :soon]
    end

  end
end
