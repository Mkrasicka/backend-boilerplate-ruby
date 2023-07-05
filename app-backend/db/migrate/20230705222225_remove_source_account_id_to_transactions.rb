class RemoveSourceAccountIdToTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :source_account_id, :uuid
  end
end
