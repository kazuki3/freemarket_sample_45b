class ChangeDatatypeLastNameKanaOfProfiles < ActiveRecord::Migration[5.1]
  def change
      change_column :profiles, :last_name_kana, :string
  end
end
