class Admin::OrdersController < ApplicationController

    # before_action :if_not_admin　あとで復活
    before_action :set_order_detail, only: [:edit]

  def top
    @counts = Order.count
  end

  def index
    @orders = Order.all
    @order_details = OrderDetail.page(params[:page]).reverse_order
    @count_total = OrderDetail.sum(:count)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = @order_details.sum(:order_amount)
  end

  def update
    if @order = Order.find(params[:id])
       @order.update(order_status_params)
       redirect_back(fallback_location: root_path)
    elsif
      @order_detail = OrderDetail.find(params[:id])
      @order_detail.update(order_detail_params)
      redirect_back(fallback_location: root_path)
    end
  end

    private
  def order_status_params
    params.require(:order).permit(:id, :order_status)
    
  end
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :production_status)
  end

  def if_not_admin
    redirect_to root_path unless current_admin.admin_flg?
  end
  
  # def list_params
  #   params.require(:order).permit(:sell_status)
  # end

  def set_order_detail
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(params[:id])
  end
end
