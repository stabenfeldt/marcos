# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  description :string
#  log         :string
#  due_date    :date
#  bike_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Service < ActiveRecord::Base
  belongs_to :bike

  def completed?
    completed
  end

  validates :description, :due_date, :bike,
    presence: true
end
