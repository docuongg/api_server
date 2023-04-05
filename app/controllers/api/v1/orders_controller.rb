class Api::V1::OrdersController < ApplicationController
  def new
    
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.permit(:user_id, :price, :description, purchased_products_attributes: [:price, :amount, :product_id])
  end
end
