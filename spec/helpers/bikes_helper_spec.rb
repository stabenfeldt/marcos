require 'rails_helper'


describe BikesHelper do

  describe "#km_until_next_service" do
    it 'returns a human readable number' do
      expect(km_until_next_service(1000)).to eq '1000 killometer'
    end

  end
end
