class AddCommenterToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :comment_user, :string
  end
end
