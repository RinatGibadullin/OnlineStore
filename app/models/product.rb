class Product < ApplicationRecord
	has_many :ordered_product, :dependent => :destroy
	belongs_to :category
	mount_uploader :picture, PictureUploader

end
