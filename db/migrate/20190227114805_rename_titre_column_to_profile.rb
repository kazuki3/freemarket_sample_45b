class RenameTitreColumnToProfile < ActiveRecord::Migration[5.1]
  def change
    rename_column :profiles, :ddress1, :address1
    rename_column :profiles, :ddress2, :address2
  end
end
