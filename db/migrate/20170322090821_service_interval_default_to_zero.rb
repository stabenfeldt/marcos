class ServiceIntervalDefaultToZero < ActiveRecord::Migration
  def change
    change_column :parts, :service_interval, :float
  end
end
