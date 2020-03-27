class Admin::OrderDetailsController < ApplicationController

  # 管理者ログイン制限
  before_action :authenticate_admin!

  # before_action :if_not_admin
  before_action :set_order_detail, only: [:edit]

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = @order_details.sum(:order_amount)
    # @production_status = @order_details.production_status
  end
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(params[:id])
    @order_detail.update(order_detail_params)

    binding.pry
    if @order.order_details.exists?(production_status: "製作中") 
      @order.update(order_status: "製作中")
    else
      detail = @order_detail.select(:production_status).distinct
      detail == 1 && @order_detail.production_status == "製作完了"
      @order.update(order_status: "発送準備中")
    end
      redirect_back(fallback_location: root_path)
  end

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
