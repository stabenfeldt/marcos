# == Schema Information
#
# Table name: part_services
#
#  id                          :integer          not null, primary key
#  description                 :text
#  log                         :text
#  service_id                  :integer
#  bike_part_id                :integer
#  completed                   :boolean
#  service_completed_at_milage :integer
#

Fabricator(:part_service) do
  description                 "big service"
  log                         "replaced 2 parts"
  service                { Fabricate(:service) }
  completed                   false
  service_completed_at_milage 1202
end
