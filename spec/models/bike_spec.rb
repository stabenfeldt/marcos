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
#  distance   :integer          default(0)
#

require 'rails_helper'

RSpec.describe Bike, :type => :model do
  before :all do
    @rear_shock = Part.create!(brand: 'generic', model: 'generic', kind: 'rear shock',
                               service_interval: 3000,
                               note: 'Rear shocks need new oil every 3000 km')
    @cassette   = Part.create!(brand: 'generic', model: 'generic', kind: 'cassette',
                               service_interval: 3000, note: '')
    @bike       = Fabricate(:bike)
  end

  it 'is valid from the fabric' do
    expect(Part.all.size).to eq 2
    expect(@bike).to be_valid
  end

  it 'has a default set of parts' do
    nr_of_default_parts = Part.where(brand: 'generic').size
    @bike.reload
    expect(@bike.parts.size).to eq nr_of_default_parts
  end

  it 'can tell when some of its parts need service' do
    @bike.update_attribute(:distance, 4000);
    cassette_bike_part   = @bike.bike_parts.where(part_id: @cassette.id)
    rear_shock_bike_part = @bike.bike_parts.where(part_id: @cassette.id)
    # cassette_bike_part belongs to this bike only. The @cassette is the generic part
    # used by all bikes.
    expect(@bike.parts_due_for_service.size).to eq 2
    expect(@bike.parts_due_for_service).to include(cassette_bike_part, rear_shock_bike_part)
  end

end
