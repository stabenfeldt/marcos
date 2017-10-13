class ChangePartServiceIntervalToInteger < ActiveRecord::Migration
  def change
    change_column :parts, :service_interval, :integer
  end
end
