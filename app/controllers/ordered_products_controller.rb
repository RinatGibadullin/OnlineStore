class OrderedProductsController < ApplicationController
	def index
		@total_price = 0
		@current_order.ordered_products.each do |ordered_product|
			@total_price += ordered_product.price
		end
	end

	def new
		@productsIdArray ||= []

		@current_order.ordered_products.each do |ordered_product|
			@productsIdArray.push(ordered_product.product.id.to_s)
		end



		if @productsIdArray.include?(params[:product_id])

			@orderedProduct = OrderedProduct.find_by(
				product_id: params[:product_id], 
				order_id: @current_order.id)

			@amount = params[:amount].to_i

			@orderedProduct.update_attributes(
				:amount => (@orderedProduct.amount + @amount), 
				:price => @orderedProduct.product.price * (@orderedProduct.amount + @amount))
			redirect_to products_path
		else
			@orderedProduct = OrderedProduct.create(product_id: params[:product_id], 
				order_id: @current_order.id, 
				amount: params[:amount])
			@orderedProduct.update_attributes(
				:price => @orderedProduct.product.price * @orderedProduct.amount)
			@orderedProduct.save
			redirect_to products_path
		end
	end

	def destroy
		@ordered_product = OrderedProduct.find(params[:id])
		@ordered_product.destroy
		redirect_to ordered_products_path
	end

end
