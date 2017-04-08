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
end
