class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit]
	def index
		@categories = Category.all
		if params[:category_id] && !params[:category_id].empty?
			@category = Category.find(params[:category_id])
			@product = @category.products
		else
			@product = Product.all
		end
	end

	def show
	end

	private 

	def set_product
      @product = Product.find(params[:id])
    end

	def post_params
		params.require(:product).permit(:category, :title, :description, :price, :picture)
	end
end
