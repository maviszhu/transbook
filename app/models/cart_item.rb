class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def add_quantity!
    # if self.quantity < self.product.stock
      self.quantity +=1
      self.save
    # end
  end

  def reduce_quantity!
    if self.quantity > 0
      self.quantity -= 1
    end
    self.save
  end
end
