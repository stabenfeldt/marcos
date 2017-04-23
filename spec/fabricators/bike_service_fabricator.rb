Fabricator(:bike_service) do
  description   "Must fix the quirking"
  log           "I oiled it"
  due_date      "2015-11-12"
  bike          { Fabricate(:bike) }
  completed   false
end
