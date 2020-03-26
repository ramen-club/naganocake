class Admin::CustomersController < ApplicationController

	# 管理者ログイン制限
	before_action :authenticate_admin!

	def index
	  @customers = Customer.page(params[:page]).reverse_order
	end

	def show
	  @customer = Customer.find(params[:id])
	end

	def edit
	  @customer = Customer.find(params[:id])
	end

	def update
	  @customer = Customer.find(params[:id])
  	  @customer.update(customer_params)
  	  redirect_to admin_customer_path(@customer.id)
  	end


	private

    def customer_params
      params.require(:customer).permit(:family_name, :first_name, :family_kana, :first_kana, :email, :postal_code, :street_address, :tel_number, :is_active)
    end

end
