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

end
