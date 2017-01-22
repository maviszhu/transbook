class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    if @product.is_hidden == true
      redirect_to admin_products_path, warning: "无此商品页！"
    end
  end
end
