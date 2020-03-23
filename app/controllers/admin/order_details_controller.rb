class Admin::OrderDetailsController < ApplicationController

  before_action :if_not_admin
  before_action :set_item, only: [:edit]

  def edit
    @order_detail = OrderDetail.find(params[:id])
  end

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_details_params)
    redirect_to admin_order_details_path
  end

  def index
    @order_details = OrderDetail.page(params[:page]).reverse_order
    @order_detail = OrderDetail.find(params[:id])
  end

  private
  params.require(:order_detail).permit(:order_id, :production_status)

  def if_not_admin
    redirect_to root_path unless current_admin.admin_flg?
  end

  def set_item
    @item = OrderDetail.find(params[:id])
  end
end
