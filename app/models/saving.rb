class Saving < ApplicationRecord
  belongs_to :saving_category
  belongs_to :user
end
