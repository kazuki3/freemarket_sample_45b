class AddSelfIntroductionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :self_introduction, :text, null: true
  end
end
