class Category < ApplicationRecord
	has_many :products
	def t_name
   		"#{I18n.t self.name}"
	end
end
