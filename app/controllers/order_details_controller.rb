class OrderDetailsController < ApplicationController

	# 会員ログイン制限
	before_action :authenticate_customer!

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = @order_details.sum(:order_amount)
  end

end
