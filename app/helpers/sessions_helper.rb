module SessionsHelper

def current_company=(company)
	@current_company = company
end

def current_company
	@current_company ||= company_from_remember_token
end

def current_user=(user)
	@current_user = user
end

def current_user
	@current_user = user_from_facebook_token
end

def signed_in?
	!current_company.nil?
end

def http_signed_in?
	puts "HTTP Signed In: " + (!current_user.nil?).to_s
	!current_user.nil?
end

def sign_out
	self.current_company = nil
end

def authenticate
	deny_access unless signed_in?
end

def http_authenticate
	#puts "Authenticating with HTTP"
	#json_error unless http_signed_in?
	authenticate_or_request_with_http_basic do |key, value|
		key == "Sam" && value == "Stern"
	end
end

def deny_access
	store_location
	flash[:notice] = "You must be signed in to do that"
	redirect_to login_path
end

def json_error
	redirect_to "/json_error"
end

def redirect_back_or(default)
	redirect_to(session[:return_to] || default)
	clear_return_to
end

def secure_hash(string)
	Digest::SHA2.hexdigest(string)
end

private

	def user_from_facebook_token
		if ( !params[:email].nil? && !params[:facebook].nil? ) 
			User.find_by_email_and_facebook(params[:email], params[:facebook])
		else
			nil
		end
	end
	
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