class Admin::CustomersController < ApplicationController

	before_action :admin_admin

	def index
	  @customers = Customer.all
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
	  def admin_admin
	  	redirect_to(root_url) unless admin_signed_in?
	  end

      def customer_params
       params.require(:customer).permit(:family_name, :first_name, :family_kana, :first_kana, :email, :postal_code, :street_address, :tel_number, :is_active)
      end

end
