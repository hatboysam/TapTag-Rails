module TapStats

	def num_taps_since(timespan)
		num_taps_between((Date.today - timespan), Date.today)
	end

	def num_taps_between(start_day, finish_day)
		taps_between(start_day, finish_day).count
	end

	def taps_between(start_day, finish_day)
		#Comparing dates to times, which is why we have to go to 11:59pm
		self.taps.where(:tapped_time => start_day.at_midnight..(finish_day.next - 1.second))
	end

	def num_taps_on(date)
		self.taps.where(:tapped_time => date).count
	end

	def taps_in_range(start_day, finish_day)
		@a = []
		@all_taps = taps_between(start_day, finish_day)
		(start_day).upto(finish_day).each do |day|
			#Count all taps that happened on that day
			@a.push(@all_taps.select{ |x| x.tapped_time.to_date == day}.count)
		end
		@a
	end

	def total_taps
		self.taps.count
	end

end
