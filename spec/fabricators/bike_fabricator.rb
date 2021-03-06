# == Schema Information
#
# Table name: bikes
#
#  id         :integer          not null, primary key
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#  user_id    :integer
#  name       :string
#  strava_id  :string
#  distance   :integer          default(0)
#

Fabricator(:bike) do
  name "Poprad Lepmond"
  user { Fabricate(:user) }
  distance { 1001 }
end
