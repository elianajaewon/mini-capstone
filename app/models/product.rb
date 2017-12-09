class Product < ApplicationRecord
  validates :name, presence: true 
  validates :name, uniqueness: true 
  validates :price, presence: true 
  validates :price, numericality: {greater_than: 0}
  validates :description, length: {in: 5..500} 

  has_many :orders
  belongs_to :supplier
  has_many :images
  has_many :category_products

  has_many :categories, through: :category_products
  # def categories
  #   category_products.map {|category_product| category_product.category}
  # end

end 