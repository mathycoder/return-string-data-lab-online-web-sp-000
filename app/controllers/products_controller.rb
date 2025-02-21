class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.create(product_params)
    redirect_to(products_url)
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    product.inventory > 0 ? (render plain: "true") : (render plain: "false")
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :description, :inventory)
    end
end
