class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]

  def all
    @products = Product.all
    render json: @products, each_serializer: ProductSerializer
  end

  def search
    @products = Product.where("name LIKE ?", "%#{params[:key]}%")
    render json: @products, each_serializer: ProductSerializer
  end

  def index
    @products = Category.find(params[:category_id]).products
    render json: @products, each_serializer: ProductSerializer
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @product
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :unit, :price, :category_id, :avatar)
    end
end
