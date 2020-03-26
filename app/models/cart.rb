class Cart < ApplicationRecord
	has_many :cart_items
	belongs_to :customer

	def total
		price = 0
		cart_items.each do |cart_item|
		price += cart_item.item.price.to_i * cart_item.count.to_i
		# ↑「.to_i」を付けないとTypeErrorになります
		end
		return price
	end
end
