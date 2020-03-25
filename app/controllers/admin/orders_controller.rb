class Admin::OrdersController < ApplicationController

    # before_action :if_not_admin

  def top
    @counts = Order.count
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

    private
  def if_not_admin
    redirect_to root_path unless current_customer.admin?
  end
    def list_params
        params.require(:order).permit(:sell_status)
    end
end
