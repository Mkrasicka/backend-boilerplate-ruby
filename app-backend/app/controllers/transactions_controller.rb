class TransactionsController < ApplicationController
  # before_action :set_transaction, only: %i[create update destroy]

  def index
    @transactions = Transaction.all
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.account = @account
    @transaction.save
    redirect_to account_transactions_path(@account)
    # if @transaction.save
    #   redirect_to request.referer
    # else
    #   render json: { success: false, errors: @transaction.errors.full_messages }
    # end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount)
  end
end
