# == Schema Information
#
# Table name: bikes
#
#  id          :integer          not null, primary key
#  brand       :string
#  model       :string
#  year        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#

require 'rails_helper'

RSpec.describe Bike, :type => :model do
  before :all do
    @bike = Fabricate(:bike)
  end

  it 'has many parts' do
    @suspention = Fabricate(:part, brand: 'RoxShox', model: 'Reba' )
    @bike.parts << @suspention
    @bike.save
    @bike.parts.size.should eq 1
  end
end
