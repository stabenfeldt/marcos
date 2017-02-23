# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  phone     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# The User class is used for authenication for the system.
class User < ActiveRecord::Base
end
