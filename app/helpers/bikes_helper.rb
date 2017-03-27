module BikesHelper

  def km_until_next_service(part)
    until_next = part.km_until_next_service

    if until_next == 0
      return "NOW"
    elsif (until_next < 0)
      return "Overdue by #{until_next}"
    elsif (until_next > 0)
      return "In #{until_next} kilometers"
    end


  end
end
