class ApplicationController < ActionController::Base

  helper_method :current_cart

  # ログイン後に遷移するページを顧客と管理者で分ける
  def after_sign_in_path_for(resource)
  	case resource
  	when Admin
  	  admins_top_path
  	when Customer
  	  root_path
  	end
  end
  
  # 顧客の新規登録の際にデータ保存する為に以下のカラムを記載
  before_action :configure_permitted_parameters, if: :devise_controller?
   def current_cart
      if session[:cart_id]
        @cart = Cart.find(session[:cart_id])
      else
        @cart = Cart.create
        session[:cart_id] = @cart.id
        @cart
      end
    end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_kana, :first_kana, :postal_code, :street_address, :tel_number])
  end

end
