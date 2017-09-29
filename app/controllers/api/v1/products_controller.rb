class Api::V1::ProductsController < ApiController

  def index
    products = Product.all
    render json: products, status: :ok

  end

  def create
    product = Product.create!(product_params)
     if product.save
        render json: { product: product, status: 201, message: "Product successfully created!"}.to_json
     else
        render json: {errors: product.errors, status: 422, message: "name cant be blank"}.to_json
     end
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: product, status: 200, message: "Product successfully updated!"
    else
      render json: product.errors, status: 422, message: "name cant be blank"
    end
  end

  def destroy

  end

  def product_params
    params.permit(:name, :price)
  end
end
