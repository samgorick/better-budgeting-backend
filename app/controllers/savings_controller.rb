class SavingsController < ApplicationController

  def create
    # Find saving category
    category = SavingCategory.find_by(name: saving_params[:category])
    # Create saving instance
    saving = Saving.create!(name: saving_params[:name], user_id: saving_params[:user_id], saving_category_id: category.id)
    # Create savings value
    value = SavingValue.create!(saving_id: saving.id, value: saving_params[:balance])
    # Render json of savings with saving_values attached to each
    render json: saving
  end

  def index
    savings = Saving.all
    render json: savings
  end

  private

  def saving_params
    params.require(:saving).permit(:name, :category, :balance, :user_id)
  end

end