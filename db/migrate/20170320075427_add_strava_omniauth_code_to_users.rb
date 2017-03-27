class AddStravaOmniauthCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :strava_omniauth_code, :string
  end
end
