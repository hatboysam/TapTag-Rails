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
		if (params[:vendor_id])
			@title = Vendor.find(params[:vendor_id]).name
			@orders = Vendor.find(params[:vendor_id]).orders.all(:include => :vendor)
		else
			@title = "All Vendors"
			@orders = Order.all(:include => :vendor)
		end
		respond_to do |format|
			format.html
			format.json
		end
	end
end