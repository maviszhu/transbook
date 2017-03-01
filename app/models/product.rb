class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :bg_image, BgImageUploader
  validates :stock, numericality: { greater_than_or_equal_to: 0}



  def is_recommend?
    product.is_recommend
  end

  def publish!
    self.update_columns(is_hidden: false)
  end

  def hide!
    self.update_columns(is_hidden: true)
  end

end
