class TapsController < ApplicationController

	def create
		@tap = Tap.new(params[:tap])
		if (@tap.date.nil?)
			@tap.date = Date.today
		end
		if (@tap.save)
			@status = "saved"
		else
			@status = "error"
		end
	end

end