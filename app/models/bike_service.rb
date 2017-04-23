class BikeService < ActiveRecord::Base

  belongs_to :bike
  has_many :part_services
  #validates :part_services, :bike, presence: true

end
