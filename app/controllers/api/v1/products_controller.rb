class Api::V1::ProductsController < ApplicationController
  def index
    @products = Category.find(params[:category_id]).products
    render json: @products
  end
end
