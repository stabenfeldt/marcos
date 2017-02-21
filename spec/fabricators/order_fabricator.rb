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
#  bike_brand       :string
#  bike_model       :string
#  description      :string
#  valid_through    :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

Fabricator(:order) do
  name             "MyString"
  product          nil
  phone            "MyString"
  email            "MyString"
  payment_received false
  bike_brand       "MyString"
  bike_model       "MyString"
  description      "MyString"
  valid_through    "2017-02-17"
end
