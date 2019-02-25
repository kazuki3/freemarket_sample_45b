class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nickname, :string, null: false,
    add_index :users, :nickname, unique: true
    add_column :users, :first_kanji, :string, null: false,
    add_column :users, :last_kanji, :string, null: false,
    add_column :users, :first_kana, :string, null: false,
    add_column :users, :last_kana, :string, null: false,
    add_column :users, :year, :date, null: false,
    add_column :users, :month, :date, null: false,
    add_column :users, :day, :date, null: false,
  end
end
