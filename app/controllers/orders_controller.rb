class OrdersController < ApplicationController
  def new
    @order = current_customer.order.new(order_params)
  end

  def index
  end

  def show
  end

  def create
  end

  def delete
  end

  def thankyou
  end

  private
    def order_params
      params.require(:order).permit(:name, :payment_method, :postal_code, :street_address)
    end
 
end
