class AddServiceInterval < ActiveRecord::Migration
  def change
    add_column :parts, :service_interval, :int
  end
end
