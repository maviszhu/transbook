class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDstore] 感谢您完成本次的下单，以下是您这次的购物明细#{order.token}")
  end
  def apply_cancell_order(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: 'admin@test.com', subject: "#{@user.email}申请取消订单Order.#{order.id}")
  end

  def notify_cancell_order(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDstore] 您申请取消订单Order.#{order.id}，已成功取消")
  end

  def notify_ship_order(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDstore] 您的订单Order.#{order.id}已发货")
  end

  def notify_return_order(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[JDstore] 您申请退货订单Order.#{order.id}，已进入退货流程")
  end

end
