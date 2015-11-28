class ChangeDateToDatetimeOnServices < ActiveRecord::Migration
  def change
    change_column :services, :due_date, :datetime
  end
end
