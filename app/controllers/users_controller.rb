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
		@taps = @user.taps
		@rewards_tapped = @user.rewards_tapped_with_company(params[:company])
		respond_to do |format|
			format.json
		end
	end

	def completed
		@user = User.find(params[:id])
		@taps = @user.taps
		@rewards_tapped = @user.rewards_tapped_with_company(params[:company])
		@rewards_completed = @rewards_tapped.select{ |x| @user.progress_on_mindb(x, taps) >= x.actions_needed }
	end

	def visited
		@vendors = User.find(params[:id]).vendors_visited
		respond_to do |format|
			format.json
		end
	end

	def fetch
		@user = User.new(params[:user])
		@found = User.find_by_email(@user.email)
		@status = "OK"
		if (@found)
			@user = @found
			@status = "FOUND"
		elsif(@user.save)
			@status = "CREATED"
		else
			@user.id = 0
			@status = "ERROR"	
		end
		respond_to do |format|
			format.json
		end
	end

end