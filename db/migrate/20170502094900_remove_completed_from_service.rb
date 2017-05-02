class RemoveCompletedFromService < ActiveRecord::Migration
  def change
    remove_column :services, :completed, :boolean
  end
end
