class Api::V1::Analyst::CategoriesController < ApplicationController
  def index
    category_support = ::Analyst::CategorySupport.new
    render json: { statistic_category: category_support.statistic }
  end
end