# == Schema Information
#
# Table name: bikes
#
#  id          :integer          not null, primary key
#  brand       :string
#  model       :string
#  year        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  image       :string
#

Fabricator(:bike) do
  brand "MyString"
  model "MyString"
  year  "MyString"
end
