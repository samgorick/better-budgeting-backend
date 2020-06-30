class SavingsController < ApplicationController

  def create
    # Find saving category
    category = SavingCategory.find_by(name: params[:category])
    # Create saving instance
    saving = Saving.create!(name: params[:name], user_id: params[:user_id], saving_category_id: category.id)
    # Create savings value
    value = SavingValue.create!(saving_id: saving.id, value: params[:balance])
    # Render json of savings with saving_values attached to each
    render json: saving
  end

  def index
    savings = Saving.all
    render json: savings
  end

end