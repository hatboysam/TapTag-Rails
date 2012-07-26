json.vendor do |json|
	json.id vendor.id
	json.name vendor.name
	json.company_id vendor.company_id

	json.address do |json|
		json.address1 vendor.address1
		json.address2 vendor.address2
		json.city vendor.city
		json.state vendor.state
		json.zip vendor.zip
		json.coordinates do |json|
			json.lat vendor.lat
			json.lng vendor.lng
		end
	end
end