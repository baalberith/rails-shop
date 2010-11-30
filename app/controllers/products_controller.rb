class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def add_to_cart
    product = Product.find(params[:id])
    add_product_to_cart(product)
    redirect_to products_path
  end
end
