# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SpendingCategory.create([{ name: 'Rent'}, {name: 'Eating/Drinking Out'}, {name: 'Shopping'}])

Transaction.create(
  [
    {date: "2020-06-23", merchant: "Amazon", user_id: 15, spending_category_id: 3, amount: 50.99, recurring: false},
    {date: "2020-06-22", merchant: "Starbucks", user_id: 15, spending_category_id: 2, amount: 5.99, recurring: false},
    {date: "2020-06-21", merchant: "Oakwood", user_id: 15, spending_category_id: 1, amount: 3450, recurring: false},
    {date: "2020-06-23", merchant: "CVS", user_id: 15, spending_category_id: 3, amount: 15.99, recurring: false},
    {date: "2020-06-23", merchant: "McDonalds", user_id: 15, spending_category_id: 2, amount: 24, recurring: false},
  ]
)

Budget.create([
  {user_id: 1, spending_category_id: 1, amount: 3450},
  {user_id: 1, spending_category_id: 2, amount: 400},
  {user_id: 1, spending_category_id: 3, amount: 200}
])