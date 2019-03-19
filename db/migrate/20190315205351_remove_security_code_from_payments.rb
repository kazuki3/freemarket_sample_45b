class RemoveSecurityCodeFromPayments < ActiveRecord::Migration[5.1]
  def change
    remove_column :payments, :security_code
  end
end
