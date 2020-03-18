class ApplicationController < ActionController::Base
  helper_method :current_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
   def current_cart
      if session[:cart_id]
        @cart = Cart.find(session[:cart_id])
      else
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_kana, :first_kana, :postal_code, :street_address, :tel_number])
  end

end
