class Admin::OrdersController < ApplicationController

  private
  def if_not_admin
    redirect_to root_path unless current_customer.admin?
  end
  
  def sell_status.params(うんちゃら)
  end
end
