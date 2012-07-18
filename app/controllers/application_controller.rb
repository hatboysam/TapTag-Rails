class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  force_ssl

  def index
  	
  end

  def json_error
  	respond_to do |format|
  		format.json
  		format.html
  	end
  end

end
