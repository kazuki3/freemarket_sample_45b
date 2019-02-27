class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :self_introduction
      t.string :first_name
      t.string :last_name
      t.integer :first_name_kana
      t.integer :last_name_kana
      t.date :birthdate
      t.integer :zip_code
      t.string :prefecture
      t.string :city
      t.string :ddress1
      t.string :ddress2
      t.string :phone_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
