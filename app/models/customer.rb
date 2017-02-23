# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  phone      :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ActiveRecord::Base

  has_many :bikes
  has_many :services, through: :bikes
  validates :first_name, :last_name, :phone, presence: true
  validates :phone, :email, uniqueness: true, allow_blank: true

  scope :services_in_progress, -> { where(field: value) }

  def name
    "#{first_name} #{last_name}"
  end
end
