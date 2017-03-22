class CreateBikeParts < ActiveRecord::Migration
  def change
    create_table :bike_parts do |t|
      t.belongs_to :bike, index: true
      t.belongs_to :part, index: true
      t.float :service_done_at_bike_distance

      t.timestamps null: false
    end
  end
end
