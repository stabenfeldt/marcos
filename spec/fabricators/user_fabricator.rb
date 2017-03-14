# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  mobile     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  provider   :string
#  uid        :string
#  username   :string
#

Fabricator(:user) do
  first_name "MyString"
  last_name  "MyString"
  email      "MyString"
  mobile     "MyString"
end
