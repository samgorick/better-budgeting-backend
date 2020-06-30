class SavingSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :saving_category, :user_id, :saving_values

  belongs_to :saving_category
  belongs_to :user
  has_many :saving_values

  def saving_category
    @object.saving_category.name
  end

  def saving_values
    @object.saving_values
  end

end