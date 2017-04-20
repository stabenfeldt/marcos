require 'rails_helper'


describe BikesHelper do

  before :each do
  end

  describe "#km_until_next_service" do
    pending "WIP"
    it 'returns a human readable number' do
    @bike_part = Fabricate(:bike_part)
    @bike_part.save!
      expect(km_until_next_service(@bike_part)).to eq 'Om 1 tusen kilometer'
    end

  end
end
