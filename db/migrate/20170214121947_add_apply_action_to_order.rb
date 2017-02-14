class AddApplyActionToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :is_to_cancell, :boolean, default: false
    add_column :orders, :is_to_return, :boolean, default: false
  end
end
