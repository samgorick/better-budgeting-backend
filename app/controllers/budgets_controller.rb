class BudgetsController < ApplicationController

  def create
    add_budget_params.each do |budgetCategory|
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
    budget = Budget.find(edit_budget_params[:id])
    budget.update(amount: edit_budget_params[:amount])
    render json: budget
  end

  private

  def add_budget_params
    params.require(:budget).permit(:Income, :Bills, :Dining, :Groceries, :Holiday, :Housing, :Leisure, :Personal, :Savings, :Shopping, :Transport)
  end

  def edit_budget_params
    params.require(:budget).permit(:id, :amount)
  end
  
end