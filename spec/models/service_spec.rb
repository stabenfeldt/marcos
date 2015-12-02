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
  pending "add some examples to (or delete) #{__FILE__}"
end
