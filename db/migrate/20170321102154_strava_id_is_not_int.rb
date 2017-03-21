class StravaIdIsNotInt < ActiveRecord::Migration
  def change
    change_column :bikes, :strava_id, :string
  end
end
