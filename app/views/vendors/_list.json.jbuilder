json.vendors do |json|
	json.array!(list) do |json, vendor|
		json.partial! "vendor", vendor: vendor
	end
end