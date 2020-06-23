class CreateSavings < ActiveRecord::Migration[6.0]
  def change
    create_table :savings do |t|
      t.references :saving_category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
