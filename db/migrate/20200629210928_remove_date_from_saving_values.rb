class RemoveDateFromSavingValues < ActiveRecord::Migration[6.0]
  def change
    remove_column :saving_values, :date, :integer
  end
end
