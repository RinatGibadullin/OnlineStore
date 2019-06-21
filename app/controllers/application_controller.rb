class ApplicationController < ActionController::Base
	before_action :set_current_order

	def set_current_order
		# session["current_order_id"] = nil
		current_user_id = nil
		if !current_user.nil?
			current_user_id = current_user.id
		end
		if session["current_order_id"]
			@current_order = Order.find(session["current_order_id"])
			if (@current_order.status != "draft")
				@current_order = Order.create(status: "draft")
				session["current_order_id"] = @current_order.id
			end
		else
			@current_order = Order.create(status: "draft")
			session["current_order_id"] = @current_order.id
		end
	end
end
