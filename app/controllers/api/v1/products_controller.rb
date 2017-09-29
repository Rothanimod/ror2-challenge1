class Api::V1::ProductsController < ApplicationController
  def show
    respond_to :json
    respond_with Product.find(params[:id])
  end

  def index
    products = Product.all
    render json: {status: 'SUCCESS', message: 'Loaded all posts', data: [products]}, status: :ok

  end
end
