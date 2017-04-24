class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :bike, index: true, foreign_key: true
      t.date :due_date
      t.text :description
      t.text :log
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
