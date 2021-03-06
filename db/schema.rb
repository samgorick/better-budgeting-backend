# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_29_210928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spending_category_id", null: false
    t.float "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spending_category_id"], name: "index_budgets_on_spending_category_id"
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "saving_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "saving_values", force: :cascade do |t|
    t.bigint "saving_id", null: false
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["saving_id"], name: "index_saving_values_on_saving_id"
  end

  create_table "savings", force: :cascade do |t|
    t.bigint "saving_category_id", null: false
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["saving_category_id"], name: "index_savings_on_saving_category_id"
    t.index ["user_id"], name: "index_savings_on_user_id"
  end

  create_table "spending_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spending_category_id", null: false
    t.integer "date"
    t.string "merchant"
    t.float "amount"
    t.boolean "recurring"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spending_category_id"], name: "index_transactions_on_spending_category_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "budgets", "spending_categories"
  add_foreign_key "budgets", "users"
  add_foreign_key "saving_values", "savings"
  add_foreign_key "savings", "saving_categories"
  add_foreign_key "savings", "users"
  add_foreign_key "transactions", "spending_categories"
  add_foreign_key "transactions", "users"
end
