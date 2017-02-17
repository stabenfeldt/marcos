# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  price       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

Fabricator(:product) do
  name        "MyString"
  description "MyString"
  price       "MyString"
end
