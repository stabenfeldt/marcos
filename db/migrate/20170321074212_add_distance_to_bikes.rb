class AddDistanceToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :distance, :int
  end
end
