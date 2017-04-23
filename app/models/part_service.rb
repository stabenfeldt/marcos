class PartService < ActiveRecord::Base
  belongs_to :bike_service
  belongs_to :bike_part
end
