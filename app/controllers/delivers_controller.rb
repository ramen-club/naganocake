class DeliversController < ApplicationController

  def index
  	@customer = Customer.find(current_customer.id)
  	@deliver = Deliver.new
  	@delivers = Deliver.all
  end

  def create
  	@deliver = Deliver.new(deliver_params)
  	@deliver.customer_id = current_customer.id
  	@deliver.save
  	redirect_to delivers_path
  end

  def edit
  	@customer = Customer.find(current_customer.id)
  	@deliver = Deliver.find(params[:id])
  end

  def update
  	@deliver = Deliver.find(params[:id])
  	@deliver.update(deliver_params)
  	redirect_to delivers_path
  end

  def destroy
  	@deliver = Deliver.find(params[:id])
  	@deliver.destroy
  	redirect_to delivers_path
  end

  private
    def deliver_params
      params.require(:deliver).permit(:name, :postal_code, :street_address)
    end

end
