class CartsController < ApplicationController

    def show
        user = User.find(params[:user_id])
        @carts = User.cart
        @carts = 
        @price = 
          cart.count * @carts
          
    end

    def create
        current_user.cart(params[:item_id])
        redirect_to action: :sow
    end

    def update_item
        @cart = Cart.find(params[:id])
        @cart.update(cart_params)
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @cart = current_user.cart(params[:item_id])
        @cart.destroy
        redirect_back(fallback_location: root_path)
    end

    def destroy_all
        @cart = current_user.cart(params[:user_id])
        @cart.destroy
        redirect_to 'パスが分かり次第item詳細画面に遷移'
    end

end