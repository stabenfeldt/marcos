# == Schema Information
#
# Table name: services
#
#  id           :integer          not null, primary key
#  description  :string
#  log          :string
#  due_date     :datetime
#  bike_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  completed    :boolean          default(FALSE)
#  bike_part_id :integer
#

require 'rails_helper'

RSpec.describe Service, :type => :model do
  before :all do
    @service = Fabricate(:service)
  end

  it 'is valid from the fabric' do
    expect(@service).to be_valid
  end

  it 'one service can include many parts' do
    cassette_part = Fabricate(:part, kind: 'cassette' )
    chain_part   = Fabricate(:part, kind: 'chain')
    @chain = Fabricate(:bike_part, part: chain_part)
    @cassette = Fabricate(:bike_part, part: cassette_part)
    @service.bike_parts << @chain
    @service.bike_parts << @cassette
    expect(@service.bike_parts.size).to eq 2
  end
end
