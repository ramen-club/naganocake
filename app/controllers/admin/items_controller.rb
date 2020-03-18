class Admin::ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    item = Item.new
    items = Item.all
  end

  def create
    if @item = Item.new(item_params)
      @book.save
      flash[:success] = 'Item registered successfully!!!'
        redirect_to items_path
    else
        render action: :new
    end
  end

  def edit
  end

  def update
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :genre_id, :price, :sell_status, :image_id)
    end
end
