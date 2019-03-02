class RemoveReferencesFromPayments < ActiveRecord::Migration[5.1]
  def change
    remove_column :payments, :references, :integer
  end
end
