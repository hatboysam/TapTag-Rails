class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to @user
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end

	def progress
		@user = User.find(params[:id])
		@rewards_tapped = []
		if (params[:company])
			@rewards_tapped = Company.find(params[:company]).rewards
		else
			@rewards_tapped = @user.rewards_tapped
		end
		respond_to do |format|
			format.json
		end
	end

	def visited
		@vendors = User.find(params[:id]).vendors_visited
		respond_to do |format|
			format.json
		end
	end

end