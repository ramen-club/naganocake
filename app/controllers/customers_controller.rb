class CustomersController < ApplicationController

  before_action :screen_customer, only: [:show, :edit, :update]

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  end

  private
    def customer_params
       params.require(:customer).permit(:family_name, :first_name, :family_kana, :first_kana, :email, :postal_code, :street_address, :tel_number)
    end

    def screen_customer
      unless params[:id].to_i == current_customer.id
        redirect_to customer_path(current_customer)
      end
    end

end
