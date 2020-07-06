class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :jwt

  has_many :budgets
  has_many :transactions
  has_many :savings
  has_many :saving_values, through: :savings

  # Returns current month transactions only
  def transactions 
    time = Time.now
    test_date = "#{time.strftime('%Y')}-#{time.strftime('%m')}-01 00:00:00 +0000"
    @object.transactions.select { |txn| txn.created_at > test_date }
  end

  def jwt
    payload = { user_id: @object.id }
    secret = 's3cret!'
    token = JWT.encode(payload, secret, 'HS256')
  end

end
