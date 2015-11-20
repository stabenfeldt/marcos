class JoinBikesAndParts < ActiveRecord::Migration

  def change
    create_table :bikes_parts, id: false do |t|
      t.integer :bike_id
      t.integer :part_id
    end

    add_index :bikes_parts, :bike_id
    add_index :bikes_parts, :part_id
  end
end
