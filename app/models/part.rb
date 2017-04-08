# == Schema Information
#
# Table name: parts
#
#  id               :integer          not null, primary key
#  brand            :string
#  model            :string
#  year             :integer
#  note             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  tech_doc         :string
#  service_interval :float
#  kind             :string
#

class Part < ActiveRecord::Base
  has_many :bike_parts
  has_many :bikes, through: :bike_parts, dependent: :destroy

  validates :brand, :model, presence: true

  def name
    "#{brand} - #{model}"
  end

end
