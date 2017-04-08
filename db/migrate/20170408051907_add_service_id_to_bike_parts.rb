class AddServiceIdToBikeParts < ActiveRecord::Migration
  def change
    add_column :bike_parts, :service_id, :int
  end
end
