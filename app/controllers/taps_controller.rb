class TapsController < ApplicationController

	def create
		@tap = Tap.new(params[:tap])
		if (@tap.tapped_time.nil?)
			@tap.tapped_time = DateTime.now
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