class ItemsController < ApplicationController

  def top
  end

  def index
    @item = Item.all
  end

  def show
    @item = item.find(params[:id])
  end

end
