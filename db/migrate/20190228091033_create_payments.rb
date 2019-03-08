class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :card_number, null:false
      t.date :expiration_date, null:false
      t.integer :security_code, null:false
      t.integer :references, null:false
      t.references :user, null:false
      t.timestamps
    end
  end
end
