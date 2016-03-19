class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception





 private 
 def confirm_logged_in

 if session[:username]
 return true
 else
 redirect_to(:controller => 'admin', :action => 'login')
 return false
 end
end

private
def check_access_level
 	if session[:username] == "Joy"
	return true
else
	redirect_to('/admin')
	return false
 end
end
end
