class SuppliersController < ApplicationController
  def index
    suppliers = Supplier.all
    render json: suppliers.as_json
  end 

  def create
    supplier = Supplier.new(
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"])
    if supplier.save 
      render json: supplier.as_json 
    else 
      render json: {error: supplier.errors.full_messages}, status: :bad_request
    end 
  end 

  def show
    supplier_id = params["id"]
    supplier = Supplier.find_by(id: supplier_id)
    render json: supplier.as_json 
  end 

  def update
    supplier_id = params["id"]
    supplier = Supplier.find_by(id: supplier_id)
    supplier.name = params["name"]
    supplier.email = params["email"]
    supplier.phone_number = params["phone_number"]
    if supplier.save 
      render json: supplier.as_json 
    else 
      render json: {error: supplier.errors.full_messages}, status: :bad_request
  end 

  def destroy
    supplier_id = params["id"]
    supplier = Supplier.find_by(id: supplier_id)
    supplier.destroy 
    render json: {message: "Your product has been deleted."}
  end 
end
