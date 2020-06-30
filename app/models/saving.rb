class Saving < ApplicationRecord
  belongs_to :saving_category
  belongs_to :user
  has_many :saving_values
end
