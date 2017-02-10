class CartsController < ApplicationController

  def delete_all_items
    current_cart.cart_items.delete_all
    redirect_to :back
    flash[:notice] = "已清空！"
  end

  def delete_item
    item_id = params[:item].to_i
    current_cart.cart_items.find_by(id: item_id).destroy
    redirect_to :back
    flash[:notice] = "已删除！"
  end

  def add_quantity
    item_id = params[:item].to_i
    item = current_cart.cart_items.find_by(id: item_id)
    if item.quantity == item.product.stock
      redirect_to :back
      flash[:warning] = "超出库存！"
    elsif item.quantity < item.product.stock
      item.add_quantity!
      redirect_to :back
    end
  end

  def reduce_quantity
    item_id = params[:item].to_i
    item = current_cart.cart_items.find_by(id: item_id)
    item.reduce_quantity!
    redirect_to :back
  end

  def checkout
    @order = Order.new
  end


end
