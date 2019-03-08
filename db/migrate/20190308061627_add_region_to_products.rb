class AddRegionToProducts < ActiveRecord::Migration[5.1]
  def change
        add_reference :products, :prefecture, foreign_key: true
  end
end
