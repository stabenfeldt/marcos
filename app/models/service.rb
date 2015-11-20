class Service < ActiveRecord::Base
  belongs_to :bike
  belongs_to :user

  validates :description, :due_date, :bike, :user,
    presence: true
end
