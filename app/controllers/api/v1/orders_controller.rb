class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]

  def index
    @orders = Order.all

    render json: @orders.as_json(include: {user: {only: [:full_name, :address]}})
  end

  def create
    order = Order.new(order_params)
    order.total_price = order_params[:total_price]
  
    if order.save
      render json: order, status: :created
    else
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @order.can_approve? && @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :status, :total_price, :address, :description, purchased_products_attributes: [:product_id, :price, :amount])
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
