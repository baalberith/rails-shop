class CartController < ApplicationController
  def show
    @products = products_from_cart
  end
  
  def delete
    product_position = params[:product_number].to_i
    delete_position_form_cart(product_position)
    redirect_to cart_path
  end
end
