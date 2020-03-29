class SearchController < ApplicationController

	before_action :authenticate_admin!

	def search
		@model = params["search"]["model"]
		@content = params["search"]["content"]
		@records = search_for(@model, @content).page(params[:page]).reverse_order
	end


	private

	def search_for(model,content)
		if model == 'item'
			Item.where(name: content)
		else model == 'customer'
			Customer.where({family_name: content}, {first_name: content})
		end
	end

	# def search(search)
	# 	if search
	# 		Item.where(['name LIKE ?', "%#{search}%"])
	# 	else
	# 		Item.all
	# 	end
	# end

end
