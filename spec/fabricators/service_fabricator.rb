# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  description :string
#  log         :string
#  due_date    :date
#  bike_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

Fabricator(:service) do
  description "MyString"
  log         "MyString"
  due_date    "2015-11-12"
  bike        nil
  user        nil
end
