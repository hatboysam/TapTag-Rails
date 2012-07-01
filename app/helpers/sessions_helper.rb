module SessionsHelper

def current_company=(company)
	@current_company = company
end

def current_company
	@current_company ||= company_from_remember_token
end

def signed_in?
	!current_company.nil?
end

def sign_out
	self.current_company = nil
end

def authenticate
	deny_access unless signed_in?
end

def deny_access
	store_location
	flash[:notice] = "You must be signed in to do that"
	redirect_to login_path
end

def redirect_back_or(default)
	redirect_to(session[:return_to] || default)
	clear_return_to
end

def secure_hash(string)
	Digest::SHA2.hexdigest(string)
end

private
	
	def company_from_remember_token
		if session[:company_id].nil?
			nil
		else
    		Company.find(session[:company_id])
    	end
   	end

	def store_location
		session[:return_to] = request.fullpath
	end

	def clear_return_to
		session[:return_to] = nil
	end

end