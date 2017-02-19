class ProductsController < ApplicationController
  before_action :check_stock, only: [:add_to_cart]


  def index
    @IS_INDEX = true
    @q = Product.ransack(params[:q])
    @products = @q.result.where(:is_hidden => false).paginate(:page => params[:page], :per_page => 8)
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @product = Product.find(params[:id])
    if @product.is_hidden == true
      redirect_to root_path, warning: "无此商品页！"
    end
  end


  def add_to_cart
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      redirect_to :back
      flash[:notice] = "已加入购物车"
    else
      redirect_to :back
      flash[:notice] = "已在购物车中"
    end
  end

private

 def check_stock
   @product = Product.find(params[:id])
   if @product.stock == 0
     redirect_to product_path(@product), warning: "此商品已售完！"
   end
 end

end
