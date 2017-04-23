class BikeService < ActiveRecord::Base

  belongs_to :bike
  has_many :part_services
  validates :due_date, presence: true

end
