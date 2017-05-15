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

  # Vi vet bike parts, log og desvription
  # part_services_with_log =
  # [
  #   {
  #      }
  # ]
  def complete!(bike_part_ids, service_logs)
    self.update(completed: true)
    distance = BikePart.find(bike_part_ids.first).bike.distance
    BikePart.find(bike_part_ids).each_with_index do |bp,i|
      bp.update(service_done_at_bike_distance: distance)
      bike_part_service = bp.part_services.last
      bike_part_service.update!(completed: true,
                                log: service_logs[i],
                                service_completed_at_milage: distance)
    end
  end

  def complete?
    part_services.detect{ |ps| ps.completed == false }.blank?
  end
end
