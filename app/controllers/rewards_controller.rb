class RewardsController < ApplicationController

	before_filter :authenticate

	def new
		@reward = Reward.new
	end

	def create
		@reward = current_company.rewards.build(params[:reward])
		if (@reward.save)
			flash[:notice] = "New reward created"
			redirect_to @reward
		else
			flash[:notice] = "There was an error with your reward submission"
			redirect_to :new
		end
	end

	def show
		@reward = Reward.find(params[:id])
	end

end