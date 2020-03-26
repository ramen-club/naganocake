class CartItemController < ApplicationController

	# 会員ログイン制限
	before_action :authenticate_customer!

end
