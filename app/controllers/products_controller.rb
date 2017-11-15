class ProductsController < ApplicationController
  def product_all_method
    all_products = Product.all
    render json: all_products.as_json
  end 
end