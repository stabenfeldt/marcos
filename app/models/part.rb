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
#

class Part < ActiveRecord::Base
  has_and_belongs_to_many :bikes

  def name
    "#{brand} - #{model}"
  end
end
