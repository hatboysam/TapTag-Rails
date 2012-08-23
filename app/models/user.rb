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
	has_many :redemptions

	validates_presence_of :first
	validates_presence_of :last
	validates_presence_of :email
	validates_uniqueness_of :email

	def progress_on(reward)
		taps = self.taps.where(:tapped_date => reward.start_date..reward.end_date,
						:company_id => reward.company_id ).count
		used = self.times_redeemed(reward) * reward.actions_needed
		return (taps - used)
	end

	def progress_on_mindb(reward, taps, redemptions)
		date_range = (reward.start_date..reward.end_date)
		taps = taps.select{ |x| ((x.company_id == reward.company_id) && (date_range.include?(x.tapped_date)))}.count
		used = self.times_redeemed_mindb(reward, redemptions) * reward.actions_needed
		return (taps - used)
	end

	def times_redeemed(reward)
		Redemption.where(:reward_id => reward.id).count
	end

	def times_redeemed_mindb(reward, redemptions)
		redemptions.select{ |x| x.reward_id == reward.id }.count
	end

	def rewards_tapped_with_company(company_id)
		if (company_id.nil?)
			return self.rewards_tapped
		else
			return Company.find(params[:company]).rewards
		end
	end

	def companies_tapped
		company_ids = self.taps.map(&:company_id).uniq
		company_ids.map { |id| Company.find(id)}
	end

	def rewards_tapped
		rewards = self.companies_tapped.map(&:rewards)[0]
	end

	def vendors_visited
		vendor_ids = self.taps.map(&:vendor_id).uniq
		vendors = Vendor.where(:id => vendor_ids)
	end

	
end
