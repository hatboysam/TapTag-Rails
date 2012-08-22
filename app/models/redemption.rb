# == Schema Information
#
# Table name: redemptions
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  company_id    :integer
#  vendor_id     :integer
#  reward_id     :integer
#  taps          :integer
#  redeemed_date :date
#  created_at    :datetime
#  updated_at    :datetime
#

class Redemption < ActiveRecord::Base

	belongs_to :user
	belongs_to :company
	belongs_to :vendor
	belongs_to :reward

	validates_presence_of :reward_id
	validates_presence_of :user_id

	before_save :update_redeemed_date, :update_taps, :update_company

	def update_redeemed_date
		if(self.redeemed_date.nil?)
			self.redeemed_date = Date.today
		end
	end

	def update_taps
		if(self.taps.nil?)
			reward = Reward.find(self.reward_id)
			self.taps = reward.actions_needed unless reward.nil?
		end
	end

	def update_company
		if(!self.reward_id.nil? && self.company_id.nil?)
			reward = Reward.find(reward_id)
			self.company_id = Reward.company_id unless reward.nil?
		end
	end

end
