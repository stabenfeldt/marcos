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
#  distance   :float
#

require 'rails_helper'

RSpec.describe Bike, :type => :model do
  before :all do
    @bike = Fabricate(:bike)
  end

  it 'is valid from the fabric' do
    @bike.should be_valid
  end

  it 'has many parts' do
    @suspention = Fabricate(:part, brand: 'RoxShox', model: 'Reba' )
    @bike.parts << @suspention
    @bike.save
    @bike.parts.size.should eq 1
  end
end
