class AddCardNumberToPayments < ActiveRecord::Migration[5.1]
  def change
    change_column :payments, :card_number, :bigint
  end
end
