# == Schema Information
#
# Table name: parts
#
#  id         :integer          not null, primary key
#  brand      :string
#  model      :string
#  year       :integer
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tech_doc   :string
#

class Part < ActiveRecord::Base
  has_and_belongs_to_many :bikes
  validates :brand, :model, presence: true

  def name
    "#{brand} - #{model}"
  end
end
