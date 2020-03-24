class CartItem < ApplicationRecord
	belongs_to :item
  	belongs_to :cart
  	def subtotal
	 item.price * count
	end
end
