# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  bike_id     :integer
#  due_date    :date
#  description :text
#  log         :text
#  completed   :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Service < ActiveRecord::Base
  belongs_to :bike
  has_many :part_services, dependent: :destroy
  validates :due_date, presence: true

  scope :in_progress, -> { where(completed: false) }
  scope :delivered_to_service, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }

  def bike_parts
    part_services.collect{ |service| service.bike_part }
  end

  def complete!(part_services_with_log)
    self.update(completed: true)
    part_services_with_log.each do |part_service, log|
      distance = part_service.bike_part.bike.distance
      part_service.bike_part.update(service_done_at_bike_distance: distance)
      part_service.update(completed: true, log: log)
    end
  end

  def complete?
    !part_services.select{ |ps| ps.completed == false }.present?
  end
end
