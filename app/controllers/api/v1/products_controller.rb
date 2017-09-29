class Api::V1::ProductsController < ApiController

  def index
    products = Product.all
    render json: products, status: :ok

  end

  def create
    product = Product.create!(product_params)
     if product.save
        render json: { product: product, status: :created, message: "Product successfully created!"}.to_json
     else
        render json: {errors: product.errors, status: :unprocessable_entity, message: "name cant be blank"}.to_json
     end
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: product, status: :ok, message: "Product successfully updated!"
    else
      render json: product.errors, status: :unprocessable_entity, message: "name cant be blank"
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      render json: {status: :no_content}.to_json
    end
  end

  def product_params
    params.permit(:name, :price)
  end
end
