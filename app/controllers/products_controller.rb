class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    if @product.is_hidden == true
      redirect_to admin_products_path, warning: "无此商品页！"
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    redirect_to :back
    flash[:notice] = "已加入购物车"
  end   



end
