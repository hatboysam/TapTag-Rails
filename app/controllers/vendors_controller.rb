class VendorsController < ApplicationController

	def new
		@vendor = Vendor.new
	end

	def create
		@vendor = current_company.vendors.build(params[:vendor])
		@vendor.setLatLong
		if @vendor.save
			flash[:notice] = "Vendor #{@vendor.name} added!"
			redirect_to current_company
		else
			flash.now[:notice] = "There are errors in your form"
			render :new
		end

	end

	def show
		@order = Order.new
		@vendor = Vendor.find(params[:id], :include => :orders)
		respond_to do |format|
			format.html
			format.json
		end	
	end

	def index
		@vendors = Vendor.find(:all)	
		respond_to do |format|
			format.json
		end	
	end

	def near
		@radius = params[:radius]
		if (@radius.nil?)
			@radius = 10
		end
		@vendors = Vendor.within(@radius, :origin => [params[:lat], params[:lng]])
		respond_to do |format|
			format.json
		end
	end

end