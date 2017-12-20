class Order < ApplicationRecord
  belongs_to :user 
  belongs_to :product
  has_many :carted_products 

  def as_json
    {
      product_id: product_id,
      quantity: quantity, 
      subtotal: subtotal, 
      tax: tax, 
      total: total
    }
  end 
end
