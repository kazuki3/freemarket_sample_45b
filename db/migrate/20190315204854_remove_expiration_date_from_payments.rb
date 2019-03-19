class RemoveExpirationDateFromPayments < ActiveRecord::Migration[5.1]
  def change
    remove_column :payments, :expiration_date
  end
end
