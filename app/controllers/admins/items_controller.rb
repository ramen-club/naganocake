class Admins::ItemsController < ApplicationController

  before_action :if_not_admin
  before_action :set_item, only: [:show, :edit, :destroy]

  def index
    genre = Genre.all
  end

  def show
    @item = item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    if @item = Item.new(item_params)
      @genre = Genre.new(genre_params)
      @genres = Genre.all
      @item.save(item_params) && @genre.save(genre_params)
      flash[:success] = 'Item registered successfully!!!'
      redirect_to admins_items_path
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
      params.require(:item).permit(:name, :description, :price, :sale_status, :image)
    end

    def genre_params
      params.require(:genre).permit(:name)
    end

    def if_not_admin
      redirect_to root_path unless current_admin.admin_flg?
    end

    def set_item
      @item = Item.find(params[:id])
    end
end
