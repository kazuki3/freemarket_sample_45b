class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.integer :first_name_kana, null:false
      t.integer :last_name_kana, null:false
      t.date :birthdate, null:false
      t.integer :zip_code, null:false
      t.string :prefecture, null:false
      t.string :city, null:false
      t.string :ddress1, null:false
      t.string :ddress2, null:true
      t.string :phone_number,null:true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
