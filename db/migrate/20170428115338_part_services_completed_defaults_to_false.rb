class PartServicesCompletedDefaultsToFalse < ActiveRecord::Migration
  def change
    change_column :part_services, :completed, :boolean, :default => false
  end
end
