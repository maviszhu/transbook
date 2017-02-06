module CartsHelper
  def render_cart_total_price(cart)
    s = 0
    cart.cart_items.each do |cart_item|
      if cart_item.product.price.present?
        s += cart_item.product.price * cart_item.quantity
      end
    end
    s
  end

end
