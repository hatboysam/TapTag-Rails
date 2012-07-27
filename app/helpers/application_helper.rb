module ApplicationHelper

	def link_to_submit(text)
		link_to_function text, "$(this).closest('form').submit()"
	end

	def datetime_as_string(datetime)
		Date.strptime(datetime.to_s, "%Y-%m-%d %H:%M:%S %Z").strftime("%m/%d/%Y")
	end

end
