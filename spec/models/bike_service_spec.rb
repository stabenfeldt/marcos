require 'rails_helper'

RSpec.describe BikeService, :type => :model do
  before :all do
    @bike_service = Fabricate(:bike_service)
    @part_service = Fabricate(:part_service)
    @bike_service.part_services << @part_service
  end

  it 'is valid from the fabric' do
    expect(@bike_service).to be_valid
  end

  it 'A bike bike_service has one or more PartServices' do
    expect(@bike_service).to be_valid
  end

end
