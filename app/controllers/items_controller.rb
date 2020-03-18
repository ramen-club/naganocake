class ItemsController < ApplicationController

  def top
  end

  def index
    @item = Item.all
    @genre = Genre.all
  end

  def show
    @item = item.find(params[:id])
  end

end
