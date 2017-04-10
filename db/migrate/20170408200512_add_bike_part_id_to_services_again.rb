class AddBikePartIdToServicesAgain < ActiveRecord::Migration
  def change
    add_column :services, :bike_part_id, :int
  end
end
