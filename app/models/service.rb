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

  has_many :bike_parts
  belongs_to :bike


  validates :bike_parts, :bike, presence: true
  #validates :description, :due_date, presence: true


  scope :in_progress, -> { where(completed: false) }
  scope :completed,   -> { where(completed: true)  }

  def completed?
    completed
  end


end
