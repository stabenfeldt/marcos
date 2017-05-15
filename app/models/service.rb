# == Schema Information
#
# Table name: services
#
#  id                   :integer          not null, primary key
#  description          :string
#  log                  :string
#  due_date             :date
#  bike_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  completed            :boolean          default(FALSE)
#  delivered_to_service :boolean          default(FALSE)
#

class Service < ActiveRecord::Base
  belongs_to :bike
  has_many :part_services, dependent: :destroy
  validates :due_date, presence: true

  scope :in_progress, -> { where(completed: false) }
  scope :delivered_to_service, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }

  def state
    if delivered_to_service
      return "Levert til service"
    elsif completed
      return "Ferdig"
    else
      return "Venter på at sykkelen blir levert inn"
    end

  end

  def bike_parts
    part_services.collect{ |service| service.bike_part }
  end

  def complete!(bike_part_ids, service_logs)
    self.update(completed: true)
    distance = BikePart.find(bike_part_ids.first).bike.distance
    BikePart.find(bike_part_ids).each_with_index do |bp,i|
      bp.update(service_done_at_bike_distance: distance)
      bike_part_service = bp.part_services.last
      bike_part_service.update!(completed: true,
                                log: service_logs[i])
    end
  end

  def complete?
    part_services.detect{ |ps| ps.completed == false }.blank?
  end
end
