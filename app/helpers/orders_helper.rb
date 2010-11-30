module OrdersHelper
  def cart_value(cart)
    return cart.reduce(0) do |acc, prod|
      acc + prod.price
    end
  end
end
