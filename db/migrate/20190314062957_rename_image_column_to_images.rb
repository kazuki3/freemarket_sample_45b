class RenameImageColumnToImages < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :image, :image_path
  end
end
