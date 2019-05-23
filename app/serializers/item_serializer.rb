class ItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :product

  belongs_to :product, serializer: ProductSerializer
  belongs_to :order
end
