class AddServiceDescriptionToParts < ActiveRecord::Migration
  def change
    add_column :parts, :service_description, :text
  end
end
