class OrdersController < ApplicationController

  # 会員ログイン制限
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @deliver = Deliver.new
    @address = current_customer.delivers.all
  end

  def index
    customer = current_customer
    @cart_items = Cart.order(created_at: :asc).find_by(customer_id: customer.id).cart_items
    # 1.1は消費税10%を表しています
    @price = (CartItem.subtotal(@cart_items) * 1.1).round
    # 送料は800円で固定
    @postage = 800
    @order = Order.new(order_params)
    if params[:deliver_address] == "1"
      @order.name = current_customer.family_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.street_address = current_customer.street_address
    elsif params[:deliver_address] == "2"
      @order.name = Deliver.find(params[:order][:select_address].to_i).name
      @order.postal_code = Deliver.find(params[:order][:select_address].to_i).postal_code
      @order.street_address = Deliver.find(params[:order][:select_address].to_i).street_address
    elsif params[:deliver_address] == "3"
      # 住所の登録を行う
      @deliver = Deliver.new(address_params)
      @deliver.customer_id = current_customer.id
      @deliver.save
      # 登録された住所を、オーダーモデルのカラムに格納する
      @order.name = @deliver.name
      @order.postal_code = @deliver.postal_code
      @order.street_address =  @deliver.street_address
    end

  end

  def show
    # @order = Order.find(params[:id])
    # @order_details = @order.order_details
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    # @cart_item = current_customer.cart.cart_items
    # @order.charge = @price
    if @order.save
       @cart_items = current_customer.cart.cart_items
       @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.count = cart_item.count
        order_detail.order_amount = (cart_item.item.price * 1.1) * cart_item.count
        order_detail.order_id = @order.id
        order_detail.item_id = cart_item.item_id
        order_detail.save
      end
      @cart_items.destroy_all
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
      params.require(:order).permit(:customer_id, :payment_method, :postage, :charge, :name, :postal_code, :street_address)
    end

    def address_params
      params.require(:deliver).permit(:name, :postal_code, :street_address )
    end

    # def customer_params
    #   params.require(:order).permit(:customer_id, :payment_method, :postage, :charge, :name, :postal_code, :street_address )
    # end

    def detail_params
      params.require(:order_detail).permit(:order_id, :item_id, :count, :order_amount, :production_status)
    end

end
