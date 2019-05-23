class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :sku, :cost, :inventory, :imageUrl
  belongs_to :store

  def imageUrl
    self.object.photo.service_url
  end
end
