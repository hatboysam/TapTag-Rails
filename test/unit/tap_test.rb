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

require 'test_helper'

class TapTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
