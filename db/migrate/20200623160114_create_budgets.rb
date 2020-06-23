class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spending_category, null: false, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
