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
#  service_interval    :integer
#  kind                :string
#  service_description :text
#

Fabricator(:part) do
  brand "Shimano"
  model "XTR"
  year  2010
  note  "http://www.shimano.com/media/techdocs/content/cycle/SI/Alivio-Acera/RearDriveSystem/SI_6R3RA_001/SI_6R3RA_001_En_v1_m56577569830647072.pdf"
end
