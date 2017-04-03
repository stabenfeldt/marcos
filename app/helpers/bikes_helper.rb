module BikesHelper

  include ActionView::Helpers::NumberHelper


  def km_until_next_service(km_untill_next)

    if km_untill_next == 0
      return "NOW"
    elsif (km_untill_next < 0)
      return "Overdue by #{number_to_human(km_untill_next, unit: :distance)}"
    elsif (km_untill_next > 0)
      return "In #{number_to_human(km_untill_next, unit: :distance)}"
    end

  end
end
