class CreatePostages < ActiveRecord::Migration[5.1]
  def change
    create_table :postages do |t|
      t.string :name
      t.timestamps
    end
  end
end
