class AddPriceToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :price, :integer, null: false
    add_column :products, :condition, :integer, null: false
    add_column :products, :postage, :integer, null: false
    add_column :products, :shipping_method, :integer, null: false
    add_column :products, :region, :integer, null: false
    add_column :products, :date, :integer, null: false
    add_column :products, :status, :integer, null: false, default: 0
    add_reference :products, :category, foreign_key: true
    add_reference :products, :seller, foreign_key: { to_table: :users }
  end
end
