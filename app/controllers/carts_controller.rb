class CartsController < ApplicationController

    # 会員ログイン制限
    before_action :authenticate_customer!

    before_action :setup_cart_item!, only: [:add_item, :update_item]

    def index
       @carts = current_customer.cart
       @cart_items = current_customer.relations
       @cart_item = CartItem.new
    end
    def create
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.cart_id = current_customer.cart.id
        @cart_item.save
        redirect_to carts_path
    end


    def update_item
        @cart_item = CartItem.find(params[:cart_item_id])
        @cart_item.count = params[:cart_item][:count]
        @cart_item.update(cart_item_params)
        redirect_to carts_path
    end
        # 商品消去
    def delete_item
        cart_item = CartItem.find(params[:cart_item_id])
        cart_item.destroy
        redirect_to carts_path
    end
        # カート内消去
    def destroy
        cart = Cart.find(params[:id])
        cart.cart_items.each do|cart_item|
        cart_item.destroy
        end
        redirect_to carts_path
    end

    private

    def cart_item_params
      params.require(:cart_item).permit(:count, :item_id)
    end

    def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
    end
end
