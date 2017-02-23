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

Fabricator(:customer) do
  first_name "MyString"
  last_name  "MyString"
  mobile     "MyString"
  email      "MyString"
end
