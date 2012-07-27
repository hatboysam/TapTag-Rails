# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  company_id :integer
#  vendor_id  :integer
#  paid       :boolean
#  completed  :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base

	belongs_to :company
	belongs_to :vendor

end
