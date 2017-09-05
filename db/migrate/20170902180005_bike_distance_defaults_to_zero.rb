class BikeDistanceDefaultsToZero < ActiveRecord::Migration
  def change
    change_column :bikes, :distance, :float, default: 0
  end
end
