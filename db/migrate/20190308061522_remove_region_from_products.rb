class RemoveRegionFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :region, :integer
  end
end
