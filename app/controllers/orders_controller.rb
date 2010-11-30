class OrdersController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @order = Order.new
    @cart = products_from_cart
  end
  
  def create
    @order = current_user.orders.create(params[:order])
    @cart = products_from_cart
    if @order.valid?
      @cart.each do |product|
        @order.order_items.create(:product_id => product.id)
      end
      clear_cart
      redirect_to orders_path
    else
      render :action => :new
    end
  end
  
  def index
    @orders = Order.where(:user_id => current_user)
  end
end
