class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
  	before_action :authenticate_user!, except: [:index, :show]
	def index
		@product = Product.all
	end

	def show
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(post_params)

		if @product.save
			redirect_to @product
		else
			render :new
		end
	end

	def destroy
		@product.destroy
		redirect_to products_path
	end

	def edit
	end

	def update
		if @product.update_attributes(post_params)
			redirect_to @product
		else
			render :edit
		end
	end


	private 

	def set_product
      @product = Product.find(params[:id])
    end

	def post_params
		params.require(:product).permit(:category, :title, :description, :price, :picture)
	end
end
