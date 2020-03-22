class ItemsController < ApplicationController

  def top
  	if customer_signed_in?
  	@customer = Customer.find(current_customer.id)
    end
    @genres = Genre.all
  end

  def index
    @carts = Carts.all
    @item = Item.all
    @genre = Genre.all
  end

  def show
    @item = item.find(params[:id])
  end

end
