class DropBikeServices < ActiveRecord::Migration
  def change
    drop_table :part_services
    drop_table :bike_services
  end
end
