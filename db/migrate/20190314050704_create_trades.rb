class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.references :user, foreign_keys:true
      t.references :product, foreign_key:true
      t.date :approve_at, null:true
      t.timestamps
    end
  end
end
