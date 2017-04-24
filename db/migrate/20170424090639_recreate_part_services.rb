class RecreatePartServices < ActiveRecord::Migration
  create_table :part_services do |t|
    t.text :description
    t.text :log
    t.references :service, index: true, foreign_key: true
    t.references :bike_part, index: true, foreign_key: true
    t.boolean :completed
    t.integer :service_completed_at_milage
  end
end
