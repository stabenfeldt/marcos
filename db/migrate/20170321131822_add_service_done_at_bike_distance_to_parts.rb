class AddServiceDoneAtBikeDistanceToParts < ActiveRecord::Migration
  def change
    add_column :parts, :service_done_at_bike_distance, :float
  end
end
