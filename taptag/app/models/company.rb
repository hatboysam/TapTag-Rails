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

	validates :password, presence: true, length: { minimum: 6 } 
	validates :password_confirmation, presence: true
	validates_presence_of :email
	validates_uniqueness_of :email

	def self.authenticate(email, password)
		find_by_email(email).try(:authenticate, password)
	end
	
end
