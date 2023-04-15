class Api::V1::PurchasedProductsController < ApplicationController
  def index
    @purchased_products = Order.find(params[:order_id]).purchased_products

    render json: @purchased_products.as_json(include: {product: {only: [:name]}})
  end
end