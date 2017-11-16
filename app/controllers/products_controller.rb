class ProductsController < ApplicationController
  def index 
    products = Product.all 
    render json: products.as_json  
  end 

  def show 
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    render json: product.as_json 
  end 

  # def one_product_method
  #   product_id = params["input_product_id"]
  #   product = Product.find_by(id: product_id)
  #   render json: product.as_json 
  # end 

  # def product_all_method
  #   product = params["id"]
  #   render json: all_products.as_json
  # end 

  # def first_product_method
  #   first_product = Product.first 
  #   render json: first_product.as_json
  # end 

  # def second_product_method
  #   second_product = Product.second
  #   render json: second_product.as_json
  # end 

  # def third_product_method
  #   third_product = Product.third
  #   render json: third_product.as_json
  # end 

  # def fourth_product_method
  #   fourth_product = Product.fourth 
  #   render json: fourth_product.as_json
  # end 

  # def fifth_product_method
  #   fifth_product = Product.fifth
  #   render json: fifth_product.as_json
  # end 
end