# == Schema Information
#
# Table name: bikes
#
#  id          :integer          not null, primary key
#  brand       :string
#  model       :string
#  year        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#

class Bike < ActiveRecord::Base

  validates :brand, :model, presence: true
  belongs_to :customer
  has_and_belongs_to_many :parts
  has_many :services

  def name
    "#{brand} - #{model}"
  end

end
