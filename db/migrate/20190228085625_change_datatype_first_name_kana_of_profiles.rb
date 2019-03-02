class ChangeDatatypeFirstNameKanaOfProfiles < ActiveRecord::Migration[5.1]
  def change
    change_column :profiles, :first_name_kana, :string
  end
end
