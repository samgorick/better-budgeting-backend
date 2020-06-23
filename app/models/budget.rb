class Budget < ApplicationRecord
  belongs_to :user
  belongs_to :spending_category
end
