class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :bike_brand, :string
    add_column :orders, :bike_model, :string
  end
end
