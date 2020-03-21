class Admin::CustomersController < ApplicationController

	before_action :admin_admin

	def index
	  @customers = Customer.all
	end

	def show
	end

	def edit
	end

	private
	  def admin_admin
	  	redirect_to(root_url) unless admin_signed_in?
	  end

end
