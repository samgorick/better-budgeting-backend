class CreateSavingValues < ActiveRecord::Migration[6.0]
  def change
    create_table :saving_values do |t|
      t.references :saving, null: false, foreign_key: true
      t.integer :date
      t.float :value

      t.timestamps
    end
  end
end
