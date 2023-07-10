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

    respond_to do |format|
      if @transaction.valid?

        if @account.balance >= @transaction.amount
          @transaction.save
          format.html {redirect_to account_transaction_path(@account, @transaction), notice: 'Transaction created successfully.'}
          format.json { render json: @transaction }
        else
          format.html { @transaction.errors.add(:base, "Not enough money in your account") }
          format.html {render :index, status: :unprocessable_entity }
          format.json { render json: { error: "Not enough money in your account" }, status: :unprocessable_entity }
        end
      else
        format.html {render :index, status: :unprocessable_entity}
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @account = Account.find(params[:account_id])
    @transaction = Transaction.find(params[:id])
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount)
  end

  def transaction_request_params
    params.require(:transaction_request).permit(:account_id, :amount)
  end
end
