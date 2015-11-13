class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :brand
      t.string :model
      t.string :year

      t.timestamps null: false
    end
  end
end
