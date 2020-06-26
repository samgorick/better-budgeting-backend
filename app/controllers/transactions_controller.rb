class TransactionsController < ApplicationController

  def create
    spending_category = SpendingCategory.find_by(name: params[:category])
    transaction = Transaction.create!(merchant: params[:merchant], user_id: params[:user_id], spending_category_id: spending_category.id, amount: params[:amount])
    render json: transaction
  end

  def index
    transactions = Transaction.all 
    render json: transactions
  end

  def update
    transaction = Transaction.find(params[:id])
    spending_category = SpendingCategory.find_by(name: params[:category])
    transaction.update(merchant: params[:merchant], spending_category_id: spending_category.id, amount: params[:amount])
    render json: transaction
  end

  def destroy
    transaction = Transaction.find(params[:id])
    transaction.destroy
    render json: {}
  end
  
end