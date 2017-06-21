# == Schema Information
#
# Table name: part_services
#
#  id                          :integer          not null, primary key
#  description                 :text
#  log                         :text
#  service_id                  :integer
#  completed                   :boolean          default(FALSE)
#  service_completed_at_milage :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  bike_part_id                :integer
#

require 'rails_helper'

RSpec.describe PartService, :type => :model do
  before :all do
    @service = Fabricate(:service)
    @part_service = Fabricate(:part_service)
    @service.part_services << @part_service
  end

  it 'is valid from the fabric' do
    expect(@part_service).to be_valid
  end

  it 'one part_service referes to ONE part' do
    cassette_part = Fabricate(:part, kind: 'cassette' )
    @cassette = Fabricate(:bike_part, part: cassette_part)
    @part_service.bike_part = @cassette
    expect(@part_service.bike_part).to eq @cassette
  end
end
