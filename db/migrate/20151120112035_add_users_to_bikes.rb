class AddUsersToBikes < ActiveRecord::Migration
  def change
    add_reference :bikes, :customer, index: true, foreign_key: true
  end
end
