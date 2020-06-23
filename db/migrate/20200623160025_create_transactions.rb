class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spending_category, null: false, foreign_key: true
      t.integer :date
      t.string :merchant
      t.float :amount
      t.boolean :recurring

      t.timestamps
    end
  end
end
