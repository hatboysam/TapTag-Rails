module ApplicationHelper

	def link_to_submit(text)
		link_to_function text, "$(this).closest('form').submit()"
	end

	def datetime_as_string(datetime)
		datetime.strftime("%m/%d/%Y")
	end

end
