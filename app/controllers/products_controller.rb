class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show, :destroy]

  def index 
    products = Product.all.order(:id => :asc)
    if params[:search]
      products = products.where("name ILIKE ?", "%#{params[:search]}%")
    end 

    category_id = params[:input_category_id]
    if category_id 
      category = Category.find_by(id: category_id)
      products = category.products 
    end 
    
    render json: products.as_json  
  end 

  def create
    product = Product.new(
      name: params["name"], 
      price: params["price"], 
      image: params["image"], 
      description: params["description"])
    if product.save 
      render json: product.as_json 
    else 
      render json: {error: product.errors.full_messages}, status: :bad_request
    end 
  end 

  def show 
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    render json: product.as_json 
  end 

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.name = params["name"]
    product.price = params["price"]
    product.image = params["image"]
    product.description = params["description"]
    if product.save
      render json: product.as_json 
    else 
      render json: {error: product.errors.full_messages}, status: :bad_request
    end 
  end 

  def destroy
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.destroy
    render json: {message: "Your message has been destroyed!"}
  end 
end