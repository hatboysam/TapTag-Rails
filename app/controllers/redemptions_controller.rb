class RedemptionsController < ApplicationController

	def new
		@redemption = Redemption.new
	end

	def create
		#Parse Date from UNIX Timestamp
		if (!params[:redemption][:redeemed_date].nil?)
			redeemed_date = params[:redemption][:redeemed_date]
			params[:redemption][:redeemed_date] = TimeHelper.unix_to_date(redeemed_date)
		end
		@redemption = Redemption.new(params[:redemption])
		if @redemption.save
			@status = "CREATED"
		else
			@status = "ERROR"
		end

		respond_to do |format|
			format.json
		end
	end

end