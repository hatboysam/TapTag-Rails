class OrdersController < ApplicationController

	before_filter :authenticate, :only => :create

	def new
	end

	def create
		@order = current_company.orders.build(params[:order])
		@vendor = Vendor.find(params[:order][:vendor_id])
		if (@order.save)
			flash[:notice] = "Order submitted"
			redirect_to @vendor
		else
			flash[:notice] = "Problem submitting your order"
			redirect_to @vendor
		end
	end

	def show
	end
	
	def index
		@vendor = Vendor.find(params[:vendor_id])
		@orders = @vendor.orders
	end

end