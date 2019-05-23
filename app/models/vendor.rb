class Vendor < ApplicationRecord
  has_one :store
  validates :email, uniqueness: true
  validates :company, uniqueness: true
  has_secure_password

  def myOrders
    products = self.store.products.map{|product| product.id}
    products.map{|product| order = { product_id: product, name:Product.find(product).name, cost: Product.find(product).cost, quantity: Item.select{|item|item.product_id == product}.map{|x| x.quantity}.reduce{|sum,z| sum+z}}}
  end
end
