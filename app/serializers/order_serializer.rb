class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :status, :total_cost, :total_items

  has_many :items, serializer: ItemSerializer

  def total_cost
    self.object.items.reduce(0){|sum,item| sum + item.quantity * item.product.cost}
  end

  def total_items
    self.object.items.reduce(0){|sum,item| sum + item.quantity}
  end
end
