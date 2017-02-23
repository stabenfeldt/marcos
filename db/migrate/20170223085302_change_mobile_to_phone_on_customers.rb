class ChangeMobileToPhoneOnCustomers < ActiveRecord::Migration
  def change
    rename_column :customers, :mobile, :phone
  end
end
