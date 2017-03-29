require 'rails_helper'

RSpec.describe BikePart, :type => :model do
  before :each do
    @bike_part = Fabricate(:bike_part)
    @bike = @bike_part.bike
  end

  it 'is valid from the fabric' do
    expect(@bike_part).to be_valid
  end

  it 'can have one or more services' do
    @service = @bike_part.services.new(log: 'washed and oiled')
  end

end
