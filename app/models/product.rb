class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :bg_image, BgImageUploader
  validates :stock, numericality: { greater_than_or_equal_to: 0}



  def is_recommend?
    product.is_recommend
  end

end
