class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @orders = Order.all.order("created_at DESC")
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end
end
