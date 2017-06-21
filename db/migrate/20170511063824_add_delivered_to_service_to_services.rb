class AddDeliveredToServiceToServices < ActiveRecord::Migration
  def change
    add_column :services, :delivered_to_service, :boolean, :default => false
  end
end
