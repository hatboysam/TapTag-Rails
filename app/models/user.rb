# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first      :string(255)
#  last       :string(255)
#  facebook   :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  api        :string(255)
#

class User < ActiveRecord::Base
	
end
