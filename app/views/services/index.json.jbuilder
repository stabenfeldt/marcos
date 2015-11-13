json.array!(@services) do |service|
  json.extract! service, :id, :description, :log, :due_date, :bike_id, :user_id
  json.url service_url(service, format: :json)
end
