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

  validates :name, :user, presence: true
  belongs_to :user
  has_and_belongs_to_many :parts
  has_many :services

  mount_uploader :image, ImageUploader

  def parts_due_for_service
    parts.map { |p|
      km_since_last = distance - p.service_done_at_bike_distance
      return p if km_since_last >= p.service_interval
     }
  end


end
