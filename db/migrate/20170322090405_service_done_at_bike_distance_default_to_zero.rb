class ServiceDoneAtBikeDistanceDefaultToZero < ActiveRecord::Migration
  def change
    change_column :bike_parts, :service_done_at_bike_distance, :float, default: 0
  end
end
