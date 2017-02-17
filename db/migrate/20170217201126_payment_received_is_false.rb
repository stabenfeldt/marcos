class PaymentReceivedIsFalse < ActiveRecord::Migration
  def change
    change_column :orders, :payment_received, :boolean, :default => false
  end
end
