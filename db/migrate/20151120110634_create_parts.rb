class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :brand
      t.string :model
      t.integer :year
      t.text :note

      t.timestamps null: false
    end
  end
end
