class VendorSerializer < ActiveModel::Serializer
  attributes :id, :company
  has_one :store
end
