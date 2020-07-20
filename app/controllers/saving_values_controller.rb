class SavingValuesController < ApplicationController

  def create
    value = SavingValue.create(saving_params)
    saving = Saving.find(saving_params[:saving_id])
    render json: saving
  end

  def index
    savings = SavingValue.all
    render json: savings
  end

  private

  def saving_params
    params.require(:saving).permit(:saving_id, :value)
  end

end