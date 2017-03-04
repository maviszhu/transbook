class AddQualityToProductList < ActiveRecord::Migration[5.0]
  def change
    add_column :product_lists, :quality, :string
  end
end
