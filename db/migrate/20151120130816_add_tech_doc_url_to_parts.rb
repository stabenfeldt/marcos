class AddTechDocUrlToParts < ActiveRecord::Migration
  def change
    add_column :parts, :tech_doc, :string
  end
end
