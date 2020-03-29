class Admin::OrdersController < ApplicationController

  # 管理者ログイン制限
  before_action :authenticate_admin!

  # before_action :if_not_admin
  before_action :set_order_detail, only: [:edit]

  def top
    # 今日の注文件数をカウント
    start_date = Time.current.beginning_of_day
    end_date = Time.current.end_of_day
    @counts = Order.where(created_at: start_date..end_date).count
  end

  def index
    # versionで一覧表示の内容を変える
    @version = params[:version].to_s

    # トップページから　今日の注文一覧を表示
    if @version == "today"
      start_date = Time.current.beginning_of_day
      end_date = Time.current.end_of_day
      @orders = Order.where(created_at: start_date..end_date).page(params[:page]).reverse_order
      @info = "（本日の注文）"

    # 会員の詳細ページから　その会員の注文一覧を表示
    elsif @version == "customer"
      @customer = Customer.find(params[:id])
      @orders = Order.where(customer_id: @customer).page(params[:page]).reverse_order
      @info = "（#{@customer.family_name}#{@customer.first_name} の注文）"

    # ヘッダーから　注文全件の一覧を表示
    elsif @version == "all"
      @orders = Order.page(params[:page]).reverse_order
      @info = "（全注文）"

    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    # @total_price = @order_details.sum(:order_amount)
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
