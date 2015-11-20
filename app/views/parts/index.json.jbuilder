json.array!(@parts) do |part|
  json.extract! part, :id, :brand, :model, :year, :note
  json.url part_url(part, format: :json)
end
