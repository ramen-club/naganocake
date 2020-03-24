class CartItem < ApplicationRecord
	belongs_to :item
	  belongs_to :cart
	  
  	def self.subtotal(cart_items)
		price = 0
		cart_items.each do |cart_item|
		price += cart_item.item.price * cart_item.count
		end
		return price
	end
end
