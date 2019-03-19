class RemoveNumberFromPayments < ActiveRecord::Migration[5.1]
  def change
    remove_column :payments, :card_number
  end
end
