json.array!(@bikes) do |bike|
  json.extract! bike, :id, :brand, :model, :year
  json.url bike_url(bike, format: :json)
end
