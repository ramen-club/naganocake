class Cart < ApplicationRecord
	has_many :cart_items
	belongs_to :customer
	def total
		price = 0
		cart_items.each do |cart_item|
		price += cart_item.item.price * cart_item.count
		end
		return price
	end
end
