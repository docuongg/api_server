class Api::V1::Analyst::OrdersController < ApplicationController
  def index
    order_support = ::Analyst::OrderSupport.new(params)
    render json: { general: order_support.general, by_year: order_support.by_year, by_month: order_support.by_month, by_day: order_support.by_day }
  end
end
