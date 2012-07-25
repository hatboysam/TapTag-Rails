# == Schema Information
#
# Table name: vendors
#
#  id         :integer          not null, primary key
#  company_id :integer
#  category   :string(255)
#  name       :string(255)
#  address1   :string(255)
#  address2   :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :integer
#  lat        :decimal(, )
#  lng        :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#

require 'tapstats.rb'

class Vendor < ActiveRecord::Base
	include TapStats

	#Geokit things
	include Geokit::Geocoders
	acts_as_mappable
	#Relations
	belongs_to :company
	has_many :taps
	has_many :users, :through => :taps

	#Methods
	def addressToString
		address1 + " " + address2 + " " + city + " " + state + " " + zip.to_s
	end

	def getLatLong
		MultiGeocoder.geocode(addressToString)
	end

	def setLatLong
		loc = getLatLong
		self.lat = loc.lat
		self.lng = loc.lng
	end

end
