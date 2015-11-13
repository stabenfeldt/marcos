class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :description
      t.string :log
      t.date :due_date
      t.references :bike, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
