class UpdateBikeParts < ActiveRecord::Migration
  def change
    add_column :bikes_parts, :service_done_at_bike_distance, :float
  end
end
