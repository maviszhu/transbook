class CartItemsController < ApplicationController
  def destroy
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy
    flash[:warning] = "已删除商品: #{@product.title}"
    redirect_to :back
  end

  def add_quantity
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    if @cart_item.product.stock > @cart_item.quantity
      @cart_item.add_quantity!
      redirect_to :back
    else
      redirect_to :back
      flash[:warning] = "超出库存！"
    end
  end

  def reduce_quantity
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    if @cart_item.quantity > 1
      @cart_item.reduce_quantity!
      redirect_to :back
    elsif @cart_item.quantity = 1
      @cart_item.reduce_quantity!
      @product = @cart_item.product
      @cart_item.destroy
      flash[:warning] = "已删除商品: #{@product.title}"
      redirect_to :back
    end
  end

end
