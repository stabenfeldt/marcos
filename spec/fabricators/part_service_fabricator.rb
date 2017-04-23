Fabricator(:part_service) do
  description                 "big service"
  log                         "replaced 2 parts"
  bike_service                { Fabricate(:bike_service) }
  completed                   false
  service_completed_at_milage 1202
end
