class BikePart < ActiveRecord::Base
  belongs_to :bike
  belongs_to :part

  def name
    part.name
  end

  def service_interval
    part.service_interval
  end
end
