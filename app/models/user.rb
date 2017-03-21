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

# The User class is used for authenication for the system.
class User < ActiveRecord::Base

  has_many :bikes
  has_many :services, through: :bikes
  validates :first_name, :last_name, presence: true
  validates :mobile, :email, uniqueness: true, allow_blank: true

  scope :services_in_progress, -> { where(field: value) }

  def name
    "#{first_name} #{last_name}"
  end

  def fetch_bikes_from_strava
    user_data = User.fetch_user_data(strava_omniauth_code)
    user_data["athlete"]["bikes"].each do |b|
      puts "IMPORTING #{b.inspect}"
      puts "find_or_create_by #{b['id']}"
      bike = self.bikes.find_or_create_by(strava_id: b['id'])
      bike.update_attributes(name: b["name"], distance: b["distance"])
      puts "BIKE saved: #{bike.inspect}"
    end
  end

  def self.fetch_user_data(code)
    client_id     = ENV["STRAVA_CLIENT_ID"]
    client_secret = ENV["STRAVA_CLIENT_SECRET"]
    HTTParty.post( "https://www.strava.com/oauth/token?" +
                   "client_id=#{client_id}" +
                   "&client_secret=#{client_secret}" +
                   "&code=#{code}")
	end

  def self.from_strava_omniauth(code)
    user_data = fetch_user_data(code)
    username = user_data.parsed_response["athlete"]["username"]
    user = where( { username: username, provider: :strava }).first || create_from_omniauth(user_data)
    user.update_attribute(:strava_omniauth_code,  code)
    user
  end

  def self.create_from_omniauth(user_data)
		user_object = OpenStruct.new(user_data["athlete"])
    create! do |user|
      user.email      = user_object.email
      user.first_name = user_object.firstname
      user.last_name  = user_object.lastname
      user.provider   = :strava
      user.username   = user_object.username
    end
  end

  def admin?
    role.to_sym == :admin
  end

  private




end
