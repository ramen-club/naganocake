class ItemsController < ApplicationController

  def top
  	if customer_signed_in?
  	@customer = Customer.find(current_customer.id)
    end
  end

  def index
    @carts = Carts.all
  end

  def show
  end

end
