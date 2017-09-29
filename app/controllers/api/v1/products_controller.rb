class Api::V1::ProductsController < ApiController

  def index
    products = Product.all
    render json: products, status: :ok

  end

  def create
    product = Product.create!(product_params)
    render json: product, status: :ok
  end

  def product_params
    params.permit(:name, :price)
  end
end
