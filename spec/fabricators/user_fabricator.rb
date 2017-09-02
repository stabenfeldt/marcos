# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  last_name            :string
#  email                :string
#  mobile               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  provider             :string
#  uid                  :string
#  username             :string
#  role                 :string           default("normal")
#  strava_omniauth_code :string
#

Fabricator(:user) do
  first_name            {  Faker::Name.first_name }
  last_name             {  Faker::Name.last_name }
  email                 {  Faker::Internet.email }
  mobile                {  Faker::Base.numerify('########') }
  password              {  'secret' }
  password_confirmation {  'secret' }
end
