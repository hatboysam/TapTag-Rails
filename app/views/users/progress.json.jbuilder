json.user do |json|
	json.id @user.id
	json.progress do |json|
		json.array!(@rewards_tapped) do |json, a_reward|
			json.partial! "rewardprogress", reward: a_reward, user: @user
		end
	end
end