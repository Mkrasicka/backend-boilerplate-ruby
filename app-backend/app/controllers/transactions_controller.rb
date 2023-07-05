class TransactionsController < ApplicationController
  # before_action :set_transaction, only: %i[create update destroy]

  def index
    @transactions = Transaction.all
    @account = Account.find(params[:account_id])
    @transaction = Transaction.new
  end

  def create
    @account = Account.find(params[:account_id])
    @transaction = Transaction.new(transaction_params)
    @transaction.account = @account
    raise
    if @transaction.save
      redirect_to account_transactions_path(@account)
    else
          flash[:error] = @transaction.errors.full_messages.join(", ")
    flash[:backtrace] = @transaction.errors.full_backtrace.join("\n")
    redirect_to account_transactions_path(@account)
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :account_id)
  end
end
