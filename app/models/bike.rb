# == Schema Information
#
# Table name: bikes
#
#  id         :integer          not null, primary key
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#  user_id    :integer
#  name       :string
#  strava_id  :string
#  distance   :float
#

class Bike < ActiveRecord::Base

  has_many :bike_parts, dependent: :destroy
  has_many :parts, through: :bike_parts

  has_many :services
  validates :name, :user, presence: true
  belongs_to :user

  mount_uploader :image, ImageUploader

  def parts_due_for_service
    bike_parts.map { |p|
      km_since_last = distance - p.service_done_at_bike_distance
      return p if km_since_last >= p.service_interval
     }
  end


end
