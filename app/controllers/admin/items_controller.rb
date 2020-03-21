class Admin::ItemsController < ApplicationController

  before_action :if_not_admin
  before_action :set_item, only: [:show, :edit, :destroy]

  def index
    @items = Item.all
  end

  def show
    @items = item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    params[:item][:sale_status] = params[:item][:sale_status].to_i
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = 'Item registered successfully!!!'
      redirect_to admin_items_path
    else
      render action: :new
    end
  end

  def edit
    @item = Item.find[params[:id]]
  end

  def update
    params[:item][:sale_status] = params[:item][:sale_status].to_i
    @item = Item.find[params[:id]]
    if @item.update(item_params)
      flash[:success] = 'Item edited successfully!!!'
      redirect_to item_path(@item)
    else
      render action: :edit
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :price, :sale_status, :image, :genre_id)
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