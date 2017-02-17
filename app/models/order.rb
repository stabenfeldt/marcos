# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  name             :string
#  product_id       :integer
#  phone            :string
#  email            :string
#  payment_received :boolean          default(FALSE)
#  valid_through    :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  bike_brand       :string
#  bike_model       :string
#

class Order < ActiveRecord::Base
  belongs_to :product
end
