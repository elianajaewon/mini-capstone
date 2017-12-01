class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    orders = current_user.orders
    render json: orders.as_json 
  end 

  def create
    price = Product.find_by(id: params["product_id"]).price
    quantity = params["quantity"].to_i
    calculated_subtotal = quantity * price 
    calculated_tax = calculated_subtotal * 0.15
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: current_user.id, 
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    if order.save
      render json: order.as_json
    else
      render json: {error: orders.errors.full_messages}, status: :bad_request
    end 
  end 
end
