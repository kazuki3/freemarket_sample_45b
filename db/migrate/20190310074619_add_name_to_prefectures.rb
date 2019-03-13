class AddNameToPrefectures < ActiveRecord::Migration[5.1]
  def change
    add_column :prefectures, :name, :string
  end
end
