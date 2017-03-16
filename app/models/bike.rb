# == Schema Information
#
# Table name: bikes
#
#  id          :integer          not null, primary key
#  brand       :string
#  model       :string
#  year        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  image       :string
#

class Bike < ActiveRecord::Base

  validates :brand, :model, presence: true
  belongs_to :user
  has_and_belongs_to_many :parts
  has_many :services

  mount_uploader :image, ImageUploader


  def name
    "#{brand} - #{model}"
  end

end
