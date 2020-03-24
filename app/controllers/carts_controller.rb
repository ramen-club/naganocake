class CartsController < ApplicationController
    before_action :setup_cart_item!, only: [:add_item, :update_item]
    def show
    end

    def add_item
        if  @cart_item.blank?
        @cart_item = current_cart.cart_items.build(Cart_id: params[:cart_items_id])
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to current_cart
    end

    def index
       @carts = current_customer.cart
       # @cart = Cart.find
       @cart_items = current_customer.relations
    end

    def create
        current_customers.cart(params[:item_id])
        redirect_to action: :sow
    end

     def update_item
        @cart_item = CartItem.find(params[:cart_item_id])
        @cart_item.count = params[:cart_item][:count]
        @cart_item.update(cart_item_params)
        redirect_to carts_path
        # @cart_item = Cart.find(params[:id])
        # @cart.update(cart_params)
        # redirect_back(fallback_location: root_path)
        # @cart_item.update(quantity: params[:quantity].to_i)
        # redirect_to current_cart
    end
        # 商品消去
    def delete_item
        # @cart_item = current_cart_item
        cart_item = CartItem.find(params[:cart_item_id])
        cart_item.destroy
        redirect_to carts_path
    end
        # カート内消去
    def destroy
        # @cart = current_cart
        cart = Cart.find(params[:id])
        cart.cart_items.each do|cart_item|
        cart_item.destroy
        end
        redirect_to carts_path
        # else
        # redirect_back(fallback_location: carts_path)
        # end
    end

    private

    def cart_item_params
      params.require(:cart_item).permit(:count)
    end

    def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
    end
end
