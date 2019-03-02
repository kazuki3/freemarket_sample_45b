class RenameTitreColumnToProfile < ActiveRecord::Migration[5.1]
  def change
    rename_column :profiles, :address2, :address1
    rename_column :profiles, :ddress2, :address2
  end
end
