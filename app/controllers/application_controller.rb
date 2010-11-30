class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def add_product_to_cart(product)
    if session[:cart].nil?
      session[:cart] = [product]
    else
      session[:cart] << product
    end
  end
  
  def products_from_cart
    session[:cart] || []
  end
  
  def delete_position_form_cart(position)
    cart = session[:cart]
    cart.delete_at(position)
    session[:cart] = cart
  end
  
  def clear_cart
    session[:cart] = nil
  end
end
