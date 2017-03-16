class AddUserIdToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :user_id, :integer
    remove_column :bikes, :customer_id
  end
end
