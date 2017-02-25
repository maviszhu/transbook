class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def to_cancell_order
    @order = Order.find_by_token(params[:id])
    @order.to_cancell!
    OrderMailer.apply_cancell_order(@order).deliver!
    redirect_to account_orders_path
  end

  def to_return_good
    @order = Order.find_by_token(params[:id])
    @order.to_return!
    OrderMailer.apply_return_good(@order).deliver!
    redirect_to account_orders_path
  end

  def destroy
    @order = Order.find_by_token(params[:id])
    @order.destroy
  end

end
