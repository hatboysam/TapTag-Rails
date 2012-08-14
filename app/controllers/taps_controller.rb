class TapsController < ApplicationController

	def create
		@tap = Tap.new(params[:tap])
		if (@tap.date.nil?)
			@tap.date = Date.today
		end
		if (@tap.save)
			@status = "CREATED"
		else
			@status = "ERROR"
		end
		respond_to do |format|
			format.json
		end
	end

end