class TransactionsController < ApplicationController
  # before_action :set_transaction, only: %i[create update destroy]
  # before_action :set_account, only: [:create]
  # before_action :set_transaction, only: [:create]

  def index
    @transactions = Transaction.all
    @transaction = Transaction.new
    @account = Account.find(params[:account_id])
  end

  def create
    # raise
    @account = Account.find(params[:account_id])
    @transaction = Transaction.new(transaction_params)
    @transaction.account_id = params[:transaction][:account_id]
    if @transaction.save
      redirect_to account_transactions_path(@account), notice: 'Transaction created successfully.'
    else
      flash[:error] = @transaction.errors.full_messages.join(', ')
      render :index
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount)
  end

  def transaction_request_params
    params.require(:transaction_request).permit(:account_id, :amount)
  end
end
