class AddStravaIdToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :strava_id, :int
  end
end
