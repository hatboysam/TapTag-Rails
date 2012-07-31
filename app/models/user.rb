# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first      :string(255)
#  last       :string(255)
#  facebook   :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  api        :string(255)
#

class User < ActiveRecord::Base

	has_many :taps

	def progress_on(reward)
		self.taps.where(:date => reward.start_date..reward.end_date,
						:company_id => reward.company_id ).count
	end

	def companies_tapped
		@company_ids = self.taps.map(&:company_id).uniq
		@company_ids.map { |id| Company.find(id)}

	end

	def rewards_tapped
		@rewards = self.companies_tapped.map(&:rewards)[0]
	end

	def vendors_visited
		@vendor_ids = self.taps.map(&:vendor_id).uniq
		@vendors = Vendor.where(:id => @vendor_ids)
	end

	
end
