class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if current_cart.cart_items.count == 0
      render :new
    else

      if @order.save
        current_cart.cart_items.each do |cart_item|
          @product_list = ProductList.new
          @product_list.order = @order
          @product_list.product_id = cart_item.product.id
          @product_list.product_name = cart_item.product.title
          @product_list.product_price = cart_item.product.price
          @product_list.quantity = cart_item.quantity
          @product_list.quality = cart_item.product.quality
          if cart_item.product.image?
            @product_list.product_image = cart_item.product.image.small_thumb.url
          end
          @product_list.save
        end
        current_cart.clean!
        # OrderMailer.notify_order_placed(@order).deliver!
        redirect_to order_path(@order.token)
      else
        render 'carts/checkout'
      end

    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def pay
    @order = Order.find_by_token(params[:id])
    product_lists = @order.product_lists
    @order.make_payment!
    product_lists.each do |product_list|
      product = Product.find(product_list.product_id)
      product.sold!(product_list.quantity)
    end
    redirect_to order_path(@order.token), notice: "成功完成付款！"
  end

  # def pay_with_alipay
  #   @order = Order.find_by_token(params[:id])
  #   @order.set_payment_with!("alipay")
  #   @order.make_payment!
  #   redirect_to order_path(@order.token), notice: "使用支付宝成功完成付款！"
  # end
  #
  # def pay_with_wechat
  #   @order = Order.find_by_token(params[:id])
  #   @order.set_payment_with!("wechat")
  #   @order.make_payment!
  #   redirect_to order_path(@order.token), notice: "使用微信成功完成付款！"
  # end



  private
  def order_params
    params.require(:order).permit(:shipping_name, :shipping_address)
  end
end
