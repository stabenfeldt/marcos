class CreatePartServices < ActiveRecord::Migration
  def change
    create_table :part_services do |t|
      t.text :description
      t.text :log
      t.references :bike_service, index: true, foreign_key: true
      t.boolean :completed
      t.integer :service_completed_at_milage

      t.timestamps null: false
    end
  end
end
