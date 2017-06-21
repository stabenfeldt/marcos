# == Schema Information
#
# Table name: part_services
#
#  id                          :integer          not null, primary key
#  description                 :text
#  log                         :text
#  service_id                  :integer
#  completed                   :boolean          default(FALSE)
#  service_completed_at_milage :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  bike_part_id                :integer
#

Fabricator(:part_service) do
  description                 "big service"
  log                         "replaced 2 parts"
  service                     { Fabricate(:service) }
  bike_part                   { Fabricate(:bike_part) }
  completed                   false
  service_completed_at_milage 1202
end
