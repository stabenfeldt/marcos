# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  mobile     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# The User class is used for authenication for the system.
class User < ActiveRecord::Base

  def self.from_omniauth(auth_params)
    Rails.logger.debug "auth_params: #{auth_params.to_json}"
    where(auth_params.slice("provider", "uid")).first || create_from_omniauth(auth_params)
  end

  def self.create_from_omniauth(auth_params)
    uid = auth_params.uid
    provider = auth_params.provider
    name = auth_params.info.name

    create! do |user|
      user.provider   = provider
      user.uid        = uid
      user.first_name, user.last_name = name
    end
  end

  private




end
