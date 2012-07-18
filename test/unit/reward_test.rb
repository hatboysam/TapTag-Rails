# == Schema Information
#
# Table name: rewards
#
#  id             :integer          not null, primary key
#  action         :string(255)
#  start_date     :date
#  end_date       :date
#  time_sensitive :boolean
#  actions_needed :integer
#  repeats        :boolean
#  created_at     :datetime
#  updated_at     :datetime
#  company_id     :integer
#  name           :string(255)
#  description    :string(255)
#

require 'test_helper'

class RewardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
