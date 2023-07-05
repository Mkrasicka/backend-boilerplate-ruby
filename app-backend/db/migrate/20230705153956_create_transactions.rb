class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.integer :amount

      t.timestamps
    end
  end
end
