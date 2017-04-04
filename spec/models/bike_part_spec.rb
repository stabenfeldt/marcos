require 'rails_helper'

RSpec.describe BikePart, :type => :model do
  before :each do
    @part = Fabricate(:part, kind: 'rear break', service_interval: 1000)
    @bike_part = Fabricate(:bike_part, part: @part)
    @bike = @bike_part.bike
  end

  it 'is valid from the fabric' do
    expect(@bike_part).to be_valid
  end

  it 'can have one or more services' do
    @service = @bike_part.services.new(log: 'washed and oiled')
    @service = @bike_part.services.new(log: 'changed cassette')
    @service.save
    expect(@service.bike_parts.size).to eq 2
  end

end
