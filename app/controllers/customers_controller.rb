class CustomersController < ApplicationController

  before_action :screen_customer, only: [:edit, :update]

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
    def customer_params
       params.require(:customer).permit(:family_name, :first_name, :family_kana, :first_kana, :email, :postal_code, :street_address, :tel_number)
    end

    def screen_user
      unless params[:id].to_i == current_cuctomer.id
        redirect_to customer_path(current_customer)
      end
    end

end
