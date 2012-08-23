module TimeHelper
	class Unix
		def self.unix_to_datetime(unix)
			Time.at(unix / 1000).to_datetime
		end

		def self.unix_to_date(unix)
			Time.at(unix / 1000).to_date
		end
	end
end