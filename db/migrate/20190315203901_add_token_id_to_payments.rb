class AddTokenIdToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :card_token, :string
  end
end
