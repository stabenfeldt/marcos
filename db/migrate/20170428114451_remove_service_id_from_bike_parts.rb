class RemoveServiceIdFromBikeParts < ActiveRecord::Migration
  def change
    remove_column :bike_parts, :service_id
  end
end
