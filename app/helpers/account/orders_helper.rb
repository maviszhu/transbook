module Account::OrdersHelper
  def trans_order_aasm_to_string(state)
    trans = Hash["order_placed" => "未支付", "paid" => "已支付", "shipping" => "运输中", "shipped" => "已送达", "order_cancelled" => "已取消", "good_returned" => "已退货"]
    return trans[state]
  end

end
