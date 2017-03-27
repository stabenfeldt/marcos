class RemoveBikeBrandAndModelAddName < ActiveRecord::Migration
  def change
    add_column :bikes, :name, :string

    Bike.all do |b|
      b.update_attribute('name', "#{b.brand} #{b.model}")
    end

    remove_column :bikes, :brand
    remove_column :bikes, :model
  end
end
