# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  mobile     :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ActiveRecord::Base

  has_many :bikes
  has_many :services, through: :bikes

  def name
    "#{first_name} #{last_name}"
  end
end
