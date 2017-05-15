# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  bike_id     :integer
#  due_date    :date
#  description :text
#  log         :text
#  completed   :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Service, :type => :model do
  before :all do
    @bike = Fabricate(:bike, distance: 1001)
    @service = @bike.services.create!(due_date: Time.now)

    @chain_service    = Fabricate(:part_service, service: @service)
    @cassette_service = Fabricate(:part_service, service: @service)

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
    @service.complete!(
      {
        @chain_service => chain_log,
        @cassette_service => cassette_log,
      }
    )
    expect(@service.complete?).to eq true
    expect(@service.part_services.first).to eq @chain_service
    expect(@service.part_services.first.bike_part.service_done_at_bike_distance).to eq 1001.0
    expect(@service.part_services.first.log).to eq chain_log
    expect(Service.all.completed).to eq [@service]
  end

end
