class CompaniesController < ApplicationController
	include SessionsHelper

	before_filter :authenticate

	def index

	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(params[:company])
		if @company.save
			render @company
		else
			render :new
		end
	end

	def show
		@company = Company.find(params[:id], :include => :vendors)
		respond_to do |format|
			format.html
			format.json
		end	
	end

end