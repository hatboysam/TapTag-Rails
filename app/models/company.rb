@con# == Schema Information
#
# Table name: companies
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  username        :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

class Company < ActiveRecord::Base
	attr_accessible :name, :email, :username, :password, :password_confirmation
	has_secure_password

	has_many :vendors
	has_many :taps
	has_many :rewards
	has_many :users, :through => :taps

	validates :password, presence: true, length: { minimum: 6 } 
	validates :password_confirmation, presence: true
	validates_presence_of :email
	validates_uniqueness_of :email

	def self.authenticate(email, password)
		find_by_email(email).try(:authenticate, password)
	end

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
