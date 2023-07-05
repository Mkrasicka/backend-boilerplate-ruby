class TransactionsController < ApplicationController
  # before_action :set_transaction, only: %i[create update destroy]
  before_action :set_account, only: [:create]
  before_action :set_transaction, only: [:create]

  def index
    @transactions = Transaction.all
    @account = Account.find(params[:account_id])
    # @transaction = Transaction.new
    @transaction_request = TransactionRequest.new
  end

  def create
    @account = Account.find(params[:account_id])

    @transaction_request = TransactionRequest.new(params[:transaction][:account_id], params[:transaction][:amount])

    # Make the request to the Transaction Management API
    response = HTTParty.post("https://infra.devskills.app/transaction-management/api/3.1.0/transactions", body: @transaction_request.to_json, headers: { 'Content-Type' => 'application/json' })

    if response.code == 201
      redirect_to account_transactions_path(@account), notice: 'Transaction created successfully.'
    else
      flash[:error] = 'Failed to create transaction.'
    end
  end

  private

  # def transaction_params
  #   params.require(:transaction).permit(:amount)
  # end

  def transaction_request_params
    params.require(:transaction_request).permit(:account_id, :amount)
  end
end
