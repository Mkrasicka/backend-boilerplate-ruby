class TransactionsController < ApplicationController
  before_action :set_account, only: [:create, :show]

  def index
    @transactions = Transaction.all
    @transaction = Transaction.new
    @account = Account.find(params[:account_id])
  end

  def create

    @transaction = Transaction.new(transaction_params)
    @transaction.account_id = params[:transaction][:account_id]

    if @transaction.valid?
      if @account.balance >= @transaction.amount
        @transaction.save
        @account.update(balance: @account.balance - @transaction.amount)
        render json: {
          id: @transaction.id,
          account_id: @transaction.account.id,
          amount: @transaction.amount,
          created_at: @transaction.created_at,
          updated_at: @transaction.updated_at,
          account_balance: @account.balance,
          account_from_id: @account.id
        }, status: :created
      else
        @transaction.errors.add(:base, "Not enough money in your account")
        render json: { error: "Not enough money in your account" }, status: :unprocessable_entity
      end
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def show

    @transaction = Transaction.find(params[:id])
  end

  private
  def set_account
    @account = Account.find(params[:account_id])
  end

  def transaction_params
    params.require(:transaction).permit(:amount)
  end

  def transaction_request_params
    params.require(:transaction_request).permit(:account_id, :amount)
  end
end
