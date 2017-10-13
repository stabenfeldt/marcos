# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  email                  :string
#  mobile                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#  username               :string
#  role                   :string           default("normal")
#  strava_omniauth_code   :string
#  access_token           :string
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

Fabricator(:user) do
  first_name            {  Faker::Name.first_name }
  last_name             {  Faker::Name.last_name }
  email                 {  Faker::Internet.email }
  mobile                {  Faker::Base.numerify('########') }
  password              {  'secret' }
  password_confirmation {  'secret' }
end
