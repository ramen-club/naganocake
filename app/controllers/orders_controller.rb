class OrdersController < ApplicationController
  def new
    @order = Order.new
    @deliver = Deliver.new
    @address = current_customer.delivers.all
  end

  def index
    # @items = current_customer.cart.id.cart_items.all
    @order = Order.new(order_params)
    # order.payment_method = Order.find(params[:payment_method])
     if params[:order][:deliver_id] = "ご自身の住所"
      @order.name = current_customer.family_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.street_address = current_customer.street_address
     elsif params[:order][:deliver_id] = "登録済住所から撰択"
      @order.name = current_customer.delivers.name
      @order.postal_code = current_customer.delivers.postal_code
      @order.street_address = current_customer.delivers.street_address
      binding.pry
     elsif params[:order][:deliver_id] = "新しいお届け先"
      de
     else
     end
  end

  def show
  end

  def create
    if @order.save
      # redirect_to root_path
    else
      @order = Order.new
      @deliver = Deliver.new
      @address = current_customer.delivers.all
      render :new
    end
  end

  def delete
  end

  def thankyou
  end

  private
    def order_params
      params.require(:order).permit(:name, :customer_id, :deliver_id, :payment_method, :postal_code, :street_address)
    end

    def address_params
      params.require(:order).permit(:name, :postal_code, :street_address )
    end
end
