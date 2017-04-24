class RenameBikeServiceIdToServiceIdOnPartServices < ActiveRecord::Migration
  def change
    rename_column :part_services, :bike_service_id, :service_id
  end
end
