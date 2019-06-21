class OrdersController < ApplicationController

	def update
		current_user_id = nil
		if !current_user.nil?
			current_user_id = current_user.id
		end
		if (params[:order][:status] == 'created')
			@current_order.update_attributes(:status => params[:order][:status], :user_id => current_user_id)
			redirect_to ordered_products_path
		end

		if (params[:order][:status] == 'canceled')
			@order = Order.find(params[:id])
			@order.update_attributes(:status => params[:order][:status])
			redirect_to users_orders_path
		end
	end

	private 
	def post_params
		params.require(:current_order).permit(:status)
	end
end
