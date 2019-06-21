class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
  	before_action :authenticate_user!, except: [:index, :show]
	def index
		
		if params[:category_id] && !params[:category_id].empty?
			@category = Category.find(params[:category_id])
			@product = @category.products
		else
			@product = Product.all
		end
	end

	def show
	end

	def new
		@product = Product.new
		@categories = Category.all.map{|c| [ c.name, c.id ] }
	end

	def create
		@product = Product.new(post_params)
		@product.category_id = params[:category_id]
		if @product.save
			
			redirect_to @product
		else
			render :new
		end

	   # 	respond_to do |format| 
		  #  if @product.save 
		  #     format.html { redirect_to @product, notice: ‘Product was successfully created.’ } 
		  #      format.json { render :show, status: :created, location: @product } 
		  #  else 
		  #      format.html { render :new } 
		  #      format.json { render json: @product.errors, status: :unprocessable_entity } 
		  #  end 
  		# end
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
