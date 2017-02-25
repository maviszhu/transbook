module Admin::ProductsHelper
  def trans_is_hidden(state)
    state == "true" ? "未上架" : "已上架"
  end
end
