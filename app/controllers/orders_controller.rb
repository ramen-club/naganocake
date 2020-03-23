class OrdersController < ApplicationController
  def new
    @order = Order.new
    @deliver = Deliver.new
  end

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def create
  end

  def delete
  end

  def thankyou
  end

  private
    def order_params
      params.require(:order).permit(:name, :customer_id, :deliver_id, :payment_method, :postal_code, :street_address)
    end
 
end
