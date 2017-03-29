class BikePart < ActiveRecord::Base
  belongs_to :bike
  belongs_to :part
  has_many :services

  def name
    part.name
  end

  def kind
    part.kind
  end

  def service_interval
    part.service_interval
  end

  def km_until_next_service
    next_service = service_done_at_bike_distance + part.service_interval
    next_service - bike.distance
  end

  ##=
  # Service gjort 100km
  # Serice intervall 100
  # Neste service blir da 200km
  # kmstand er 200, da blir neste service på 100 + 100 = 200
  # Avstand dit blir 200 - 200 = 0 NÅ

end
