class User < ApplicationRecord
  has_secure_password

  has_many :budgets
  has_many :transactions
  has_many :savings
  has_many :saving_values, through: :savings
end
