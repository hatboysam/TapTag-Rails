class SessionsController < ApplicationController

	def new
	end

	def create
		@company = Company.find_by_email(params[:email])
		if @company && @company.authenticate(params[:password])
			session[:company_id] = @company.id
			flash[:notice] = "Welcome Back!"
			redirect_back_or company_path(@company)
		else
			flash[:notice] = "Bad Login, Try Again!"
			redirect_to login_path
		end
	end

	def destroy
		session[:company_id] = nil
		sign_out
		flash[:notice] = "Logged out!"
		redirect_to root_url
	end

end