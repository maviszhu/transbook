class ChangeNameForAdvert < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :advert_image, :bg_image #ad开头的图片会被adBlock挡掉而不显示
  end
end
