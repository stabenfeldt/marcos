# == Schema Information
#
# Table name: parts
#
#  id                  :integer          not null, primary key
#  brand               :string
#  model               :string
#  year                :integer
#  note                :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  tech_doc            :string
#  service_interval    :float
#  kind                :string
#  service_description :text
#

require 'rails_helper'

RSpec.describe Part, :type => :model do
  before :all do
    Part.create!(brand: 'generic', model: 'generic', kind: 'rear shock',
                 service_interval: 3000,
                 note: 'Rear shocks need new oil every 3000 km')
    Part.create!(brand: 'generic', model: 'generic', kind: 'cassette',
                 service_interval: 3000, note: '')
    @bike = Fabricate(:bike)
  end

  describe "Services and parts" do
    before :all do
      @bike.parts << Fabricate(:part, brand: 'RoxShox',
                               model: 'Reba', kind: 'suspension',
                               service_interval: 100)
      @bike.save
      @part_id = @bike.parts.where(kind: :suspension).first.id
      @suspension = @bike.bike_parts.where(part_id: @part_id).first
    end

    it "Know when it´s time for service" do
      @bike.update_attribute(:distance, 200)
      expect(@bike.parts_due_for_service).to match(@suspension)
    end

    it 'Each part knows how long until next service' do
      @bike.update_attribute(:distance, 50)
      expect(@suspension.km_until_next_service).to eq 50
    end

    it 'Each part can tell if it´s due for service' do
      @bike.update_attribute(:distance, 50)
      expect(@suspension.service_due?).to be false
    end

    it 'Recalculates after a service has been made' do
      @bike.update_attribute(:distance, 200)
      @suspension.update_attribute(:service_done_at_bike_distance, 100)
      expect(@suspension.km_until_next_service).to eq 0
    end
  end
end

