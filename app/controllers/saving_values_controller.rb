class SavingValuesController < ApplicationController

  def create
    value = SavingValue.create(saving_id: params[:id], value: params[:amount])
    saving = Saving.find(params[:id])
    render json: saving
  end

  def index
    savings = SavingValue.all
    render json: savings
  end

end