class Change < ActiveRecord::Migration
  def change
    change_column :bikes, :distance, :float
  end
end
