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
  before :each do
    @bike = Fabricate(:bike)
    @service = Fabricate(:service, bike: @bike)
  end

  it 'is valid from the fabric' do
    expect(@service).to be_valid
  end

  it 'one service can include many parts' do
    # Create parts
    cassette_part = Fabricate(:part, kind: 'cassette')
    chain_part    = Fabricate(:part, kind: 'chain')
    @chain = Fabricate(:bike_part, part: chain_part, bike: @bike)
    @cassette = Fabricate(:bike_part, part: cassette_part, bike: @bike)

    # Create a service for each of the parts
    @cassette_service = @cassette.services.create!(
      due_date: Time.now+100, description: 'replace this rusty one', bike: @bike
    )
    @chain_service = @chain.services.create!(
      due_date: Time.now+100, description: 'worn out, replace'
    )

    # The bike knows if any of it´s parts is in for service
    expect(@bike.in_for_service?).to eq true
    expect(@bike.services).to include(@cassette_service, @chain_service)


    #@service.bike_parts << @chain
    #@service.bike_parts << @cassette
    #expect(@service.bike_parts.size).to eq 4
  end


end
