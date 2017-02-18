class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @IS_INDEX = true
    @orders = Order.all.order("created_at DESC")
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def cancell
    @order = Order.find_by_token(params[:id])
    @order.cancell_order!
    OrderMailer.notify_cancell_order(@order).deliver!
    redirect_to admin_orders_path, alert: "成功取消订单！"
  end

  def ship
    @order = Order.find_by_token(params[:id])
    @order.ship!
    OrderMailer.notify_ship_order(@order).deliver!
    redirect_to admin_orders_path, notice: "修改订单状态为发货。"
  end

  def return
    @order = Order.find_by_token(params[:id])
    @order.return_good!
    OrderMailer.notify_return_order(@order).deliver!
    redirect_to admin_orders_path, warning: "订单进入退货流程！"
  end
end
