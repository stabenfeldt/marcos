class AddCompletedToServices < ActiveRecord::Migration
  def change
    add_column :services, :completed, :boolean, default: false
  end
end
