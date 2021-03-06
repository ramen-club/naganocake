class ItemsController < ApplicationController

  PER = 8

  def top
    # ジャンルが"有効"な場合
    @genres = Genre.where(is_active: 1)
  	if customer_signed_in?
  	@customer = Customer.find(current_customer.id)
    end
    # ジャンルが"有効"な場合
    @genres = Genre.where(is_active: 1)
    @items = Item.limit(4)
  end

  def index
    @carts = Cart.all
    @items = Item.all
    # ジャンル検索機能↓
    # ジャンルが"有効"な場合
    @genres = Genre.all
    # urlにgenre_id(params)がある場合
    if params[:genre_id]
      # ジャンルIDが一致する商品を取得
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.order(created_at: :desc).page(params[:page]).per(PER)
      @info = "#{@genre.name}"
    else
      # 全商品を取得
      @items = Item.order(created_at: :desc).page(params[:page]).per(PER)
      @info = "商品"
    end
    @counts = @items.total_count
  end
  def show
    @genres = Genre.where(is_active: 1)
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
