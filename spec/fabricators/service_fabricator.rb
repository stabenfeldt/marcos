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

Fabricator(:service) do
  #bike          nil
  #part_services nil
  due_date      "2017-04-24"
  #description   "MyText"
  #log           "MyText"
  #completed     false
end
