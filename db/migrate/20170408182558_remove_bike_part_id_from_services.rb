class RemoveBikePartIdFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :bike_part_id, type: 'int'
  end
end
