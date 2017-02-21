json.array!(@orders) do |order|
  json.extract! order, :id, :name, :product_id, :phone, :email, :payment_received, :bike_brand, :bike_model, :description, :valid_through
  json.url order_url(order, format: :json)
end
