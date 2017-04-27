# == Schema Information
#
# Table name: bike_parts
#
#  id                            :integer          not null, primary key
#  bike_id                       :integer
#  part_id                       :integer
#  service_done_at_bike_distance :float            default(0.0)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  service_id                    :integer
#

class BikePart < ActiveRecord::Base
  belongs_to :bike
  belongs_to :part
  has_many :part_services

  def name
    part.name
  end

  def service_description
    part.service_description
  end

  def kind
    part.kind
  end

  def service_interval
    part.service_interval
  end

  def in_for_service?
    part_services.where(completed: false).present?
  end

  def km_until_next_service
    next_service = service_done_at_bike_distance + part.service_interval
    next_service - bike.distance
  end

  def service_due?
    km_until_next_service <= 0
  end

  ##=
  # Service gjort 100km
  # Serice intervall 100
  # Neste service blir da 200km
  # kmstand er 200, da blir neste service på 100 + 100 = 200
  # Avstand dit blir 200 - 200 = 0 NÅ

end
