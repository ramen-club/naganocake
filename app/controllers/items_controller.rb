class ItemsController < ApplicationController

  def top
  	if customer_signed_in?
  	@customer = Customer.find(current_customer.id)
    end
    @genres = Genre.all
    @items = Item.limit(4)
  end

  def index
    @carts = Cart.all
    @items = Item.all
    # @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

end
