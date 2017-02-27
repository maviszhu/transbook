class AddColumnsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :quality, :string
    add_column :products, :writer, :string
    add_column :products, :publisher, :string
    add_column :products, :coment_title, :string
    change_column :products, :price, :integer
  end
end
