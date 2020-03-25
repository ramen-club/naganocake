class SearchController < ApplicationController

	def search
		@items = Item.search(params[:search])
	end


	private

	def search(search)
		if search
			Item.where(['name LIKE ?', "%#{search}%"])
		else
			Item.all
		end
	end

end
