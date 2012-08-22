module TimeHelper

	def unix_to_datetime(unix)
		Time.at(unix / 1000).to_datetime
	end

	def unix_to_date(unix)
		Time.at(unix / 1000).to_date
	end

end