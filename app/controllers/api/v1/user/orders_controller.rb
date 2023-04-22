class Api::V1::User::OrdersController < ApplicationController

  def index
    @orders = User.find(params[:id]).orders

    render json: @orders.to_json
  end
end
