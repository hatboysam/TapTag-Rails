# == Schema Information
#
# Table name: taps
#
#  id          :integer          not null, primary key
#  vendor_id   :integer
#  company_id  :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  tapped_time :datetime
#  tapped_date :date
#

class Tap < ActiveRecord::Base

	belongs_to :user
	belongs_to :company
	belongs_to :vendor

	before_save :update_tapped_time, :update_tapped_date

	def update_tapped_time
		if (self.tapped_time.nil?)
			self.tapped_time = DateTime.now
		end
	end

	def update_tapped_date
		self.tapped_date = self.tapped_time.to_date
	end

	def self.unix_to_datetime(unix)
		Time.at(unix / 1000).to_datetime
	end

end
