if @transaction.persisted?
  json.inserted_item render(partial: "transactions/transaction", locals: {account: @account, transaction: @transaction}, formats: html)
  json.form render(partial: "transactions/new_transaction", locals: {account: @account, transaction: Transaction.new }, formats: html)

else
  json.form render(partial: "transactions/new_transaction", locals: {account: @account, transaction: @transaction }, formats: html)

end
