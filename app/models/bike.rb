class Bike < ActiveRecord::Base

  validates :brand, :model, presence: true
  belongs_to :customer
  has_many :parts

  def name
    "#{brand} - #{model}"
  end

end
