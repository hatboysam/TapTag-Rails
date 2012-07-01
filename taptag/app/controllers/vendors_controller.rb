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
		@vendor = Vendor.find(params[:id])
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

end