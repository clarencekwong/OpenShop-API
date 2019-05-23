class StoreSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :imageUrl
  belongs_to :vendor
  has_many :products

  def imageUrl
    self.object.photo.service_url
  end
end
