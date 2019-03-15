class CreateShippingMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :shipping_methods do |t|
      t.string :name, null: true
      t.references :postage ,foreign_key: true
      t.timestamps
    end
  end
end
