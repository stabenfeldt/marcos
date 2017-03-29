# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  description :string
#  log         :string
#  due_date    :datetime
#  bike_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  completed   :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe Service, :type => :model do
  before :all do
    Part.create!(brand: 'generic', model: 'generic', kind: 'rear shock',
                 service_interval: 3000,
                 note: 'Rear shocks need new oil every 3000 km')
    @cassette = Part.create!(brand: 'generic', model: 'generic', kind: 'cassette',
                 service_interval: 3000, note: '')
    @bike = Fabricate(:bike)
    @service = @cassette.services.new
  end

  it 'is valid from the fabric' do
    expect(@service).to be_valid
  end
end
