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


end
