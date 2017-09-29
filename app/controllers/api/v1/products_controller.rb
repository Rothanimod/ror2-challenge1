class Api::V1::ProductsController < ApiController

  def index
    products = Product.all
    render json: products, status: :ok

  end

  def create
    product = Product.create!(product_params)
    respond_to do |format|
     if product.save
       format.json { render json: product, status: 201 }
     else
       format.json { render json: product.errors, status: 422 }
     end
   end
  end

  def product_params
    params.permit(:name, :price)
  end
end
