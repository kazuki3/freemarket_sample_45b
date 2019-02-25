class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nickname, :string, null: false,
    add_index :users, :nickname, unique: true
    add_column :users, :family_name_kanji, :string, null: false,
    add_column :users, :first_name_kanji, :string, null: false,
    add_column :users, :family_name_kana, :string, null: false,
    add_column :users, :first_name_kana, :string, null: false,
    add_column :users, :year, :date, null: false,
    add_column :users, :month, :date, null: false,
    add_column :users, :day, :date, null: false,
  end
end
