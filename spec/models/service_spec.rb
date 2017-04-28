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
    @bike = Fabricate(:bike)
    @service = @bike.services.create!(due_date: Time.now)

    @service.part_services << Fabricate(:part_service, service: @service)
    @service.part_services << Fabricate(:part_service, service: @service)
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

end
