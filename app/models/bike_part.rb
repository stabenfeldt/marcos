class BikePart < ActiveRecord::Base
  belongs_to :bike
  belongs_to :part

  def name
    part.name
  end

  def kind
    part.kind
  end

  def service_interval
    part.service_interval
  end

  def km_untill_next_service
    bike.distance - service_done_at_bike_distance
  end

end
