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
    @bike       = Fabricate(:bike, distance: 3000)
  end

  it 'is valid from the fabric' do
    expect(@bike).to be_valid
  end

  it 'is delegated default parts' do
    expect(@bike.parts.all.size).to eq 2
  end

  it 'can tell when some of its parts need service' do
    @cassette_bike_part   = @bike.bike_parts.where(part_id: @cassette.id).first
    @rear_shock_bike_part = @bike.bike_parts.where(part_id: @rear_shock.id).first
    expect(@bike.parts_due_for_service).to \
      include(@cassette_bike_part, @rear_shock_bike_part)
  end

  it 'returns a list of all bike with parts due for service' do
    expect(Bike.due_for_service).to include(@bike)
  end

end
