class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]

  def index
    @orders = Order.all

    render json: @orders.as_json(include: {user: {only: [:full_name, :address]}})
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
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
    params.permit(:user_id, :price, :description, :status, purchased_products_attributes: [:price, :amount, :product_id])
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
