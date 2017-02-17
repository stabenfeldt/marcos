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

Fabricator(:order) do
  name             "MyString"
  product          nil
  phone            "MyString"
  email            "MyString"
  payment_received false
  valid_through    "2017-02-17"
end
