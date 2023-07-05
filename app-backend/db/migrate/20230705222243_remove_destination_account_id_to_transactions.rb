class RemoveDestinationAccountIdToTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :destination_account_id, :uuid
  end
end
