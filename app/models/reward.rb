# == Schema Information
#
# Table name: rewards
#
#  id             :integer          not null, primary key
#  action         :string(255)
#  start_date     :date
#  end_date       :date
#  time_sensitive :boolean
#  actions_needed :integer
#  repeats        :boolean
#  created_at     :datetime
#  updated_at     :datetime
#  company_id     :integer
#  name           :string(255)
#  description    :string(255)
#

class Reward < ActiveRecord::Base

	belongs_to :company

	def taps_over_time
		@last_day = [Date.today, end_date].min
		self.company.taps_in_range(start_date, @last_day)
	end

	def num_days_running
		@last_day = [Date.today, end_date].min
		(@last_day - start_date).to_i
	end

	def total_taps
		self.company.num_taps_between(start_date, end_date)
	end	

end
