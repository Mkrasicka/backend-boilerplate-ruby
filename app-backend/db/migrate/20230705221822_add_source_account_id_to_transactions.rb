class AddSourceAccountIdToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :source_account_id, :uuid
  end
end
