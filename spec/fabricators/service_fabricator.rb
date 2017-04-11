# == Schema Information
#
# Table name: services
#
#  id           :integer          not null, primary key
#  description  :string
#  log          :string
#  due_date     :datetime
#  bike_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  completed    :boolean          default(FALSE)
#  bike_part_id :integer
#

Fabricator(:service) do
  description "Must fix the quirking"
  log         "I oiled it"
  due_date    "2015-11-12"
  bike        { Fabricate(:bike) }
  bike_parts(count: 2)

end
