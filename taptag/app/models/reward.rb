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
#

class Reward < ActiveRecord::Base
end
