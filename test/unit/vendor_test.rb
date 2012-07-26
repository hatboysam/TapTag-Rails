# == Schema Information
#
# Table name: vendors
#
#  id         :integer          not null, primary key
#  company_id :integer
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

require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
