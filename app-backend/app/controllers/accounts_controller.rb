class AccountsController < ApplicationController
  def show
    @account = Account.find(params[:id])
    @transactions = @account.transactions
  end
end
