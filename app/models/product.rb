class Product < ApplicationRecord
	has_many :ordered_product, :dependent => :destroy
	mount_uploader :picture, PictureUploader
  #validates :title, :brand, :price, :model, presence: true
  #validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  #validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed" }
  #validates :price, numericality: { only_integer: true }, length: { maximum: 7 }

end
