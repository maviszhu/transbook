class CartsController < ApplicationController

  def clean
    current_cart.clean!
    redirect_to :back
    flash[:notice] = "已清空！"
  end


  def checkout
    @order = Order.new
  end


end
