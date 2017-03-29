Fabricator(:bike_part) do
  bike { Fabricate(:bike) }
  part { Fabricate(:part) }
end
