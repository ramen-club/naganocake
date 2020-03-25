class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_cart, :logged_in?

  # ログイン後に遷移するページを顧客と管理者で分ける
  def after_sign_in_path_for(resource)
  	case resource
    # 管理者ログイン時
  	when Admin
  	  admin_orders_top_path
    # 顧客ログイン時
  	when Customer
      current_cart
  	  root_path
  	end
  end
  # 顧客の新規登録の際にデータ保存する為に以下のカラムを記載
  def current_cart
    logger.debug(session[:cart_id])
    if current_customer.cart.nil?
      current_customer.build_cart
      current_customer.cart.save
    end
    @cart = current_customer.cart
  end

  protected
  # 顧客の新規登録の際にデータ保存する為に以下のカラムを記載
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_kana, :first_kana, :postal_code, :street_address, :tel_number])
  end

end
