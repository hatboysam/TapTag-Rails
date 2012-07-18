# == Schema Information
#
# Table name: taps
#
#  id         :integer          not null, primary key
#  vendor_id  :integer
#  company_id :integer
#  user_id    :integer
#  date       :date
#  created_at :datetime
#  updated_at :datetime
#

class Tap < ActiveRecord::Base

	belongs_to :user
	belongs_to :company
	belongs_to :vendor

end
