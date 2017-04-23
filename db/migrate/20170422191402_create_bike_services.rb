class CreateBikeServices < ActiveRecord::Migration
  def change
    create_table :bike_services do |t|
      t.text :description
      t.text :log
      t.datetime :due_date
      t.string :bike_id
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
