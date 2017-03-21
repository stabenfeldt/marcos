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
    expect(@bike).to be_valid
  end


  describe "Services and parts" do
    before :all do
      @suspention = Fabricate(:part, brand: 'RoxShox', model: 'Reba',
                              kind: 'suspension', service_interval: 100,
                              service_done_at_bike_distance: 0)
      @bike.parts << @suspention
      @bike.save
    end

    it "Know when it´s time for service" do
      @bike.update_attribute(:distance, 200)
      expect(@bike.parts_due_for_service).to match(@suspention)
    end


  end
end
