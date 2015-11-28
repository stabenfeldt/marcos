# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  description :string
#  log         :string
#  due_date    :datetime
#  bike_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  completed   :boolean          default(FALSE)
#

class Service < ActiveRecord::Base
  belongs_to :bike

  scope :in_progress, -> { where(completed: false) }
  scope :completed,   -> { where(completed: true)  }

  def completed?
    completed
  end

  validates :description, :due_date, :bike,
    presence: true
end
