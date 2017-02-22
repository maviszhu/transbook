class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :advert_image, AdvertImageUploader
  validates :stock, numericality: { greater_than_or_equal_to: 0}
end
