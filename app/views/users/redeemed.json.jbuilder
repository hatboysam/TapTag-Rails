json.redeemed do |json|
	json.array!(@rewards) do |json, a_reward|
		json.partial! "rewardredeemed", reward: a_reward
	end
end