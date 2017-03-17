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
#  provider   :string
#  uid        :string
#  username   :string
#  role       :string           default("normal")
#

require 'rails_helper'

RSpec.describe User, :type => :model do

  it 'admin?' do
    user = Fabricate(:user, role: :admin)
    expect(user.admin?).to be true
  end
end
