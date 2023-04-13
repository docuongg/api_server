class Api::V1::Analyst::ProductsController < ApplicationController
  def index
    product_support = ::Analyst::ProductSupport.new
    render json: { popular_product: product_support.desc_statistic}
  end
end