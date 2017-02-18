class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  @IS_INDEX = false

  helper_method :current_cart

  def check_admin
    if !current_user.is_admin
      redirect_to root_path, alert: "当前账号"+current_user.email+"没有权限！"
    end
  end

  def current_cart
    @current_cart ||= find_cart
  end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end

end
