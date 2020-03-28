class Admin::OrdersController < ApplicationController

  # 管理者ログイン制限
  before_action :authenticate_admin!

  # before_action :if_not_admin
  before_action :set_order_detail, only: [:edit]

  def top
    @counts = Order.count
  end

  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = @order_details.sum(:order_amount)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_status_params)
    
    if @order.order_status == "入金確認"
      @order.order_details.each do |order_detail|
        order_detail.update(production_status: "製作待ち")
      end
    end

    redirect_back(fallback_location: root_path)
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

  def set_order_detail
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(params[:id])
  end
end
