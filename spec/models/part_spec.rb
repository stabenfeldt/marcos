# == Schema Information
#
# Table name: parts
#
#  id         :integer          not null, primary key
#  brand      :string
#  model      :string
#  year       :integer
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Part, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
