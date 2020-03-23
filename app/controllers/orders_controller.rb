class OrdersController < ApplicationController
  def new
    @order = Order.new
    @deliver = Deliver.new
  end

  def index
    @orders = Order.find(params[:id])
  end

  def show
    @orders = Order.find(current_customer.id)
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
