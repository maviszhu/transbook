class AddIsRecommendToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :is_recommend, :boolean, default: false
  end
end
