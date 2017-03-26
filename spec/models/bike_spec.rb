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
                 service_interval: 3000,
                 note: 'Rear shocks need new oil every 3000 km')
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
      @bike.parts << Fabricate(:part, brand: 'RoxShox',
                               model: 'Reba', kind: 'suspension',
                               service_interval: 100)
      @bike.save
      @part_id = @bike.parts.where(kind: :suspension).first.id
      @suspension = @bike.bike_parts.where(part_id: @part_id).first
      @bike.update_attribute(:distance, 200)
    end

    it "Know when it´s time for service" do
      expect(@bike.parts_due_for_service).to match(@suspension)
    end

    it 'Each part knows how long untill next service' do
      @bike.update_attribute(:distance, 50)
      expect(@suspension.km_untill_next_service).to eq 50
    end

    it 'Recalculates after a service has been made' do
      @bike.update_attribute(:distance, 200)
      @suspension.update_attribute(:service_done_at_bike_distance, 100)
      expect(@suspension.km_untill_next_service).to eq 100
    end

  end
end
