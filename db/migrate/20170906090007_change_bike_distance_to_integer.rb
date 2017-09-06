class ChangeBikeDistanceToInteger < ActiveRecord::Migration
  def change
    change_column :bikes, :distance, :integer
  end
end
