class UserSerializer < ActiveModel::Serializer
  attributes :id, :email

  has_many :budgets
  has_many :transactions
  has_many :savings
  has_many :saving_values, through: :savings

end
