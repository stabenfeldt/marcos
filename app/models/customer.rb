class Customer < ActiveRecord::Base

  has_many :bikes

  def name
    "#{first_name} #{last_name}"
  end
end
