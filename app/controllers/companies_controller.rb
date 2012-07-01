class CompaniesController < ApplicationController
	include SessionsHelper

	before_filter :authenticate, :only => [:show, :index]

	def index

	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(params[:company])
		if @company.save
			flash[:notice] = "Thanks for signing up for Tapt.ag!"
			redirect_to @company
		else
			flash.now[:notice] = "There was an erorr signing up"
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