# == Schema Information
#
# Table name: bike_parts
#
#  id                            :integer          not null, primary key
#  bike_id                       :integer
#  part_id                       :integer
#  service_done_at_bike_distance :float            default(0.0)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

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
    @bike_part.services.create(log: 'washed and oiled')
    @bike_part.services.create(log: 'changed cassette')
    expect(@bike_part.services.size).to eq 2
  end

end
