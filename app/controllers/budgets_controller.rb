class BudgetsController < ApplicationController

  def create
    params[:budget].each do |budgetCategory|
      spending_category = SpendingCategory.find_by(name: budgetCategory[0])

      Budget.create!(user_id: params[:user_id], spending_category_id: spending_category.id, amount: budgetCategory[1])
    end
    user = User.find(params[:user_id])
    render json: user.budgets
  end

  def index
    budgets = Budget.all 
    render json: budgets
  end

  def update
    budget = Budget.find(params[:id])
    budget.update(amount: params[:amount])
    render json: budget
  end

  # def update
  #   transaction = Transaction.find(params[:id])
  #   spending_category = SpendingCategory.find_by(name: params[:category])
  #   transaction.update(merchant: params[:merchant], spending_category_id: spending_category.id, amount: params[:amount])
  #   render json: transaction
  # end
  
end