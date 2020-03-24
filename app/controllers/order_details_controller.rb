class OrderDetailsController < ApplicationController

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

end
