# == Schema Information
#
# Table name: bike_parts
#
#  id                            :integer          not null, primary key
#  bike_id                       :integer
#  part_id                       :integer
#  service_done_at_bike_distance :float            default(0.0)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  service_id                    :integer
#

Fabricator(:bike_part) do
  bike { Fabricate(:bike) }
  part { Fabricate(:part) }
end
