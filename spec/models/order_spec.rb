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
#  description      :text
#

require 'rails_helper'

RSpec.describe Order, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
