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
#  distance   :integer          default(0)
#

class Bike < ActiveRecord::Base

  has_many :bike_parts, dependent: :destroy
  has_many :parts, through: :bike_parts

  has_many :services, dependent: :destroy
  validates :name, :user, presence: true
  belongs_to :user

  after_create :add_default_parts

  mount_uploader :image, ImageUploader

  scope :services_in_progress,   -> { services.where(completed: false)  }

  def in_for_service?
    services.where(completed: false).present?
  end

  def parts_due_for_service
    bike_parts.map { |bp| bp if bp.service_due? }.compact!
  end

  def add_default_parts
    default_parts.each do |part|
      next unless part
      self.parts << part
    end
    save!
  end

  def default_parts
    Rails.logger.debug  "Found #{Part.where(model: 'generic').all}.size parts"
    Part.where(model: :generic).all
  end

  def self.due_for_service
    Bike.all.collect { |b| b if (b.parts_due_for_service.present?) }
  end

end
