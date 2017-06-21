# == Schema Information
#
# Table name: part_services
#
#  id                          :integer          not null, primary key
#  description                 :text
#  log                         :text
#  service_id                  :integer
#  completed                   :boolean          default(FALSE)
#  service_completed_at_milage :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  bike_part_id                :integer
#

class PartService < ActiveRecord::Base
  belongs_to :service
  belongs_to :bike_part

  validates :bike_part, :service, presence: true
end
