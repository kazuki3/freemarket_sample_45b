class ChangeColumnOfProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :postage, :integer
    remove_column :products, :shipping_method, :integer
    add_reference :products, :postage, foreign_key: true
    add_reference :products, :shipping_method, foreign_key: true
  end
end
