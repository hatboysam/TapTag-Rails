# == Schema Information
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
		self.taps.where(:date => (Date.today -  timespan)..Date.today).count
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

	def total_taps
		self.taps.count
	end

	
end
