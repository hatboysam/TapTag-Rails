module TapStats

	def num_taps_since(timespan)
		num_taps_between((Date.today - timespan), Date.today)
	end

	def num_taps_between(start_day, finish_day)
		self.taps.where(:date => start_day..finish_day).count
	end

	def num_taps_on(date)
		self.taps.where(:date => date).count
	end

	def taps_by_day(num)
		@a = []
		#Go "num" days into the past, counting down
		(num -1).downto(0).each do |num|
			@a.push(num_taps_on(Date.today - num.days))
		end
		@a
	end

	def taps_in_range(start_day, finish_day)
		@a = []
		(start_day).upto(finish_day).each do |day|
			@a.push(num_taps_on(day))
		end
		@a
	end

	def total_taps
		self.taps.count
	end

end
