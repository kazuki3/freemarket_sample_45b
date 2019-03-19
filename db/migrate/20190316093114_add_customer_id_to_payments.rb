class AddCustomerIdToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :customer_id, :string
  end
end
