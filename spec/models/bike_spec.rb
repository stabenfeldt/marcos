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
    Part.create!(brand: 'generic', model: 'generic', kind: 'rear shock',
                 service_interval: 3000, note: 'Rear shocks need new oil every 3000 km')
    Part.create!(brand: 'generic', model: 'generic', kind: 'cassette',
                 service_interval: 3000, note: '')
    @bike = Fabricate(:bike)
    #puts "#{Part.all.size} parts creatd. Lets start the test."
  end

  it 'is valid from the fabric' do
    #byebug
    expect(Part.all.size).to eq 2
    expect(@bike).to be_valid
  end

  it 'has a default set of parts' do
    nr_of_default_parts = Part.where(brand: 'generic').size
    #byebug
    @bike.reload
    expect(@bike.parts.size).to eq nr_of_default_parts
  end


  describe "Services and parts" do
    before :all do
      @suspention = Fabricate(:part, brand: 'RoxShox', model: 'Reba',
                              kind: 'suspension', service_interval: 100,
                              )
      @bike.parts << @suspention
      @bike.save
    end

    it "Know when it´s time for service" do
      part_id = @bike.parts.where(kind: :suspension).first.id
      bike_part = @bike.bike_parts.where(part_id: part_id).first
      bike_part.update_attribute(:service_done_at_bike_distance, 100)
      @bike.update_attribute(:distance, 200)
      expect(@bike.parts_due_for_service).to match(bike_part)
    end


  end
end
