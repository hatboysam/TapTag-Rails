class TapsController < ApplicationController

	def create
		#Parse DateTime from UNIX Timestamp
		if (params[:tap][:tapped_time])
			@tapped_time = params[:tap][:tapped_time]
			@parsed = Time.at(@tapped_time / 1000).to_datetime
			params[:tap][:tapped_time] = @parsed
		end
		#Build Tap
		@tap = Tap.new(params[:tap])
		#Time is now if not stated
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