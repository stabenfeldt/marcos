class AddBikePartIdToPartServices < ActiveRecord::Migration
  def change
    add_column :part_services, :bike_part_id, :integer
  end
end
