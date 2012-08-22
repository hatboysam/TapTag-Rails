require 'timehelper.rb'

class TapsController < ApplicationController

	def create
		#Parse DateTime from UNIX Timestamp
		if (!params[:tap][:tapped_time].nil?)
			tapped_time = params[:tap][:tapped_time]
			params[:tap][:tapped_time] = TimeHelper.unix_to_datetime(tapped_time)
		end
		@tap = Tap.new(params[:tap])
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