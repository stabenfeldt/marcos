# == Schema Information
#
# Table name: services
#
#  id           :integer          not null, primary key
#  description  :string
#  log          :string
#  due_date     :datetime
#  bike_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  completed    :boolean          default(FALSE)
#  bike_part_id :integer
#

class Service < ActiveRecord::Base

  belongs_to :bike
  has_many :bike_parts
  accepts_nested_attributes_for :bike_parts

  validates :due_date, presence: true

  scope :in_progress, -> { where(completed: false) }
  scope :completed,   -> { where(completed: true)  }

  def completed?
    completed
  end


end
