class OrdersController < ApplicationController

  def new
    @order = Order.new
    @deliver = Deliver.new
    @address = current_customer.delivers.all
  end
  
  def index
    # @items = current_customer.cart.cart_item
    customer = current_customer
    @cart_items = Cart.order(created_at: :asc).find_by(customer_id: customer.id).cart_items
    @price = CartItem.subtotal(@cart_items)
    @postage = 800
    @order = Order.new(order_params)
    # order.payment_method = Order.find(params[:payment_method])
    if params[:deliver_address] == "1"
      @order.name = current_customer.family_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.street_address = current_customer.street_address
    elsif params[:deliver_address] == "2"
      @order.name = Deliver.find(params[:order][:select_address].to_i).name
      @order.postal_code = Deliver.find(params[:order][:select_address].to_i).postal_code
      @order.street_address = Deliver.find(params[:order][:select_address].to_i).street_address
    elsif params[:deliver_address] == "3"
      @order.name = Order.name
      @order.postal_code = Order.postal_code
      @order.street_address = Order.street_address
    end

  end

  def show
    # @order = Order.find(params[:id])
    # @order_details = @order.order_details
  end

  def create
    @order = Order.new(customer_params)
    # 3/26追記↓
    @order_details = OrderDetails.new(detail_params)
    @order.customer_id = current_customer.id
    if @order.save
      # binding.pry
      redirect_to orders_thankyou_path
    else
      @order = Order.new
      @deliver = Deliver.new
      @address = current_customer.delivers.all
      render :new
    end
  end

  def thankyou
  end

  private
    def order_params
      params.require(:order).permit(:name, :customer_id, :payment_method, :postal_code, :street_address)
    end

    def address_params
      params.require(:order).permit(:name, :postal_code, :street_address )
    end

    def customer_params
      params.require(:order).permit(:customer_id, :payment_method, :postage, :charge, :name, :postal_code, :street_address )
    end

    def detail_params
      params.require(:order_detail).permit(:order_id, :item_id, :count, :order_amount, :production_status)
    end

end
