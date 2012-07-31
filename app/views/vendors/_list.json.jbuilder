json.vendors do |json|
	json.array!(list) do |json, vendor|
		json.partial! "vendors/vendor", vendor: vendor
	end
end