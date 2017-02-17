class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.references :product, index: true, foreign_key: true
      t.string :phone
      t.string :email
      t.boolean :payment_received, default: false
      t.string :bike_brand
      t.string :bike_model
      t.string :description
      t.date :valid_through

      t.timestamps null: false
    end
  end
end
