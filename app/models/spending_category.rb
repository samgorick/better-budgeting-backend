class SpendingCategory < ApplicationRecord
  has_many :budgets
  has_many :transactions
end
