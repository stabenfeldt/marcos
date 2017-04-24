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
end
