class AddDestinationAccountIdToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :destination_account_id, :uuid
  end
end
