class TransactionsController < ApplicationController

  def create
    transaction = Transaction.create!(merchant: params[:merchant], user_id: params[:user_id], spending_category_id: params[:category], amount: params[:amount])
    render json: transaction
  end

  def index
    transactions = Transaction.all 
    render json: transactions
  end
  
end