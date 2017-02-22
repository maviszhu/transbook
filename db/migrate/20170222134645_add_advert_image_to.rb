class AddAdvertImageTo < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :advert_image, :string
  end
end
