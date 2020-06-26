class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :merchant, :amount, :created_at, :spending_category

  belongs_to :spending_category

  def spending_category
    @object.spending_category.name
  end

end
