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
      return ["#{ ActiveSupport::NumberHelper.number_to_human((km_until_next * -1 ), precision: 0)
               } km siden", :over]
    elsif (km_until_next > 0)
      return ["Om #{km_until_next.to_i} kilometer", :soon]
    end

  end
end
