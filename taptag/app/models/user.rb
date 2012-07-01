# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first      :string(255)
#  last       :string(255)
#  joined     :date
#  facebook   :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
end
