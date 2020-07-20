class TransactionsController < ApplicationController

  def create
    # Find spending category id, replace spending category name with ID
    find_spending_category
    all_data = (transaction_params.merge(spending_category_id: @spending_category.id))
    all_data.delete(:category)
    transaction = Transaction.create!(all_data)
    render json: transaction
  end

  def index
    transactions = Transaction.all 
    render json: transactions
  end

  def update
    find_transaction
    find_spending_category
    @transaction.update(merchant: transaction_params[:merchant], amount: transaction_params[:amount], spending_category_id: @spending_category.id)
    render json: @transaction
  end

  def destroy
    find_transaction
    @transaction.destroy
    render json: {}
  end

  private

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end

  def find_spending_category
    @spending_category = SpendingCategory.find_by(name: transaction_params[:category])
  end

  def transaction_params
    params.require(:transaction).permit(:id, :category, :merchant, :amount, :user_id)
  end
  
end