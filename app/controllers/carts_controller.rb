class CartsController < ApplicationController
    before_action :setup_cart_item!, only: [:add_item, :update_item]
    def show
    end

    def add_item
        if  @cart_item.blank?
        @cart_item = current_cart.cart_items.build(items_id: params[:items_id])
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to current_cart
    end

    def index 
       @carts = current_customer.carts.last
       # @cart = Cart.find(2)
       @cart_items = current_customer.relations
       # @carts = current_customer.carts
       # @crat_detail = Crat.find(params[:id])
       # @cart_item_detail = Cart_item.find(params[:id])
    end

    def create
        current_customers.cart(params[:item_id])
        redirect_to action: :sow
    end

     def update_item
        # @cart_item = Cart.find(params[:id])
        # @cart.update(cart_params)
        # redirect_back(fallback_location: root_path)
        @cart_item.update(quantity: params[:quantity].to_i)
        redirect_to current_cart
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

    def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
    end
end
