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
#

class Tap < ActiveRecord::Base

	belongs_to :user
	belongs_to :company
	belongs_to :vendor

end
