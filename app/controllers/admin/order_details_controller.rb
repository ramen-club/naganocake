class Admin::OrderDetailsController < ApplicationController

  # 管理者ログイン制限
  before_action :authenticate_admin!

  # before_action :if_not_admin
  before_action :set_order_detail, only: [:edit]

  # def show
  #   @order = Order.find(params[:id])
  #   @order_details = @order.order_details
  #   @total_price = @order_details.sum(:order_amount)
  #   # binding.pry
  #   # @production_status = @order_details.production_status.find(params[:id])
  # end
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_back(fallback_location: root_path)
  end
  
  # def index
  #   @order_details = OrderDetail.page(params[:page]).reverse_order
  #   @count_total = OrderDetail.sum(:count)
  # end

  private
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
