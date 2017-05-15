# == Schema Information
#
# Table name: services
#
#  id                   :integer          not null, primary key
#  description          :string
#  log                  :string
#  due_date             :date
#  bike_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  completed            :boolean          default(FALSE)
#  delivered_to_service :boolean          default(FALSE)
#

Fabricator(:service) do
  #bike          nil
  #part_services nil
  due_date      "2017-04-24"
  #description   "MyText"
  #log           "MyText"
  #completed     false
end
