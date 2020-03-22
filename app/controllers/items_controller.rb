class ItemsController < ApplicationController

  def top
    @genres = Genre.all
  	if customer_signed_in?
  	@customer = Customer.find(current_customer.id)
    end
    @genres = Genre.all
    @items = Item.limit(4)
  end

  def index
    @carts = Carts.all
    @item = Item.all
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

end
