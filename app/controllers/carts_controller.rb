class CartsController < ApplicationController

    def show
        user = User.find(params[:user_id])
        @cart = User.cart_item
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
        current_user.cart(params[:item_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy_all
        current_user>cart(params[:user_id])
        redirect_to 'パスが分かり次第item詳細画面に遷移'
    end

end
