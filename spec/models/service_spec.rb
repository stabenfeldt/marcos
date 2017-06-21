# == Schema Information
#
# Table name: services
#
#  id                   :integer          not null, primary key
#  description          :string
#  log                  :string
#  due_date             :date
#  bike_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  completed            :boolean          default(FALSE)
#  delivered_to_service :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe Service, :type => :model do
  before :all do
    @bike = Fabricate(:bike, distance: 1001)
    @service = @bike.services.create!(due_date: Time.now)

    @chain_part       = Fabricate(:part, kind: 'chain')
    @cassette_part    = Fabricate(:part, kind: 'cassette')
    @chain            = Fabricate(:bike_part, part: @chain_part,    bike: @bike)
    @cassette         = Fabricate(:bike_part, part: @cassette_part, bike: @bike)
    @chain_service    = Fabricate(:part_service, service: @service, bike_part: @chain)
    @cassette_service = Fabricate(:part_service, service: @service, bike_part: @cassette)

    @service.part_services << @chain_service
    @service.part_services << @cassette_service
  end

  it 'is valid from the fabric' do
    expect(@service).to be_valid
  end

  it 'A bike service has one or more PartServices' do
    expect(@service.part_services.size).to eq 2
  end

  it 'can list all bike parts' do
    expect(@service.bike_parts.size).to eq 2
    expect(@service.bike_parts.first.class).to be BikePart
  end

  it 'mark all part_services as complete' do
    chain_log    = 'oiled and replaced one link'
    cassette_log = 'replaced outer ring'
    bike_part_ids = [ @chain.id, @cassette.id ]
    service_logs = [ chain_log, cassette_log ]

    @service.complete!( bike_part_ids, service_logs )
    @service.reload
    expect(@service.completed).to eq true
    expect(@service.complete?).to eq true
    expect(@service.part_services.first).to eq @chain_service
    expect(@service.part_services.first.bike_part.service_done_at_bike_distance).to eq 1001.0
    expect(@service.part_services.first.log).to eq chain_log
    expect(Service.all.completed).to eq [@service]
  end


  describe "States" do

    before :each do
      @service = Fabricate(:service)
    end

    it 'the default state' do
      expect(@service.delivered_to_service).to be false
      expect(@service.completed).to be false
    end

    it 'delivered_to_service!' do
      @service.delivered_to_service!
      expect(@service.delivered_to_service).to be true
      expect(@service.completed).to be false
    end

  end
end
