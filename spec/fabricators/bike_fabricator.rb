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
#  strava_id  :integer
#

Fabricator(:bike) do
  brand "MyString"
  model "MyString"
  year  "MyString"
  user { Fabricate(:user) }
end
