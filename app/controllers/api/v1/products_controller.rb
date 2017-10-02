class Api::V1::ProductsController < ApiController

  def index
    products = Product.all
    render json: products, status: :ok

  end

  def create
    product = Product.create!(product_params)
     if product.save
       render json: product, status: :created, message: "Product succesfully created!"
     else
       render json: { errors: product.errors }, status: :unprocessable_entity, message: "name cant be blank"
     end
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: product, status: :ok, message: "Product successfully updated!"
    else
      render json: product.errors.to_json, status: :unprocessable_entity, message: "name cant be blank"
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      head :no_content
    end
  end

  def product_params
    params.permit(:name, :price)
  end
end
