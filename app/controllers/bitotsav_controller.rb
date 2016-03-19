class BitotsavController < ApplicationController
	
layout "bitotsav"
 after_action :allow_facebook_iframe

 
  def allow_facebook_iframe
    response.headers['X-Frame-Options'] = 'ALLOW-FROM https://bitotsav.in'
  end


	
	
	before_action :bitotsav_logged_in , :except => [:login, :attempt_login, :logout, :index]

def index

	@volunteer = Bitotsav::Volunteer.order('Role', 'Name').all
	@organiser = Bitotsav::Organiser.order('Role', 'Name').all

end

def login

	if session[:bitotsav]
		redirect_to(:controller => 'bitotsav', :action => 'select')
	else
	end

end

def select
end

def newcore

core = Bitotsavcore.new(:name => params[:name], :email => params[:email], :fblink => params[:fblink], :contact => params[:contact])

if core.save
	redirect_to '/bitotsav/select'
	flash[:notice] = "Record saved succesfully"
else
	redirect_to '/bitotsav/select'
	flash[:notice] = "Cant save at the moment"
end

end 


def attempt_login

	if params[:username].present? && params[:password].present?
		found_user = Bitotsav::Admin.where(:username => params[:username]).first
	if found_user
		authorised_user = found_user.authenticate(params[:password])
	end
	end

 	if authorised_user
	session[:user_id] = authorised_user.id
	session[:bitotsav] = authorised_user.username 
   		redirect_to(:action => 'select')
	else
	flash[:notice] = "Invalid username/password"
	redirect_to(:action => 'login')
	end


end
   
def logout

	session[:user_id] = nil
        session[:bitotsav] = nil
	response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    	response.headers["Pragma"] = "no-cache"
    	response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
	flash[:notice] = "Logged out | Please RELOAD the page to login again"
	redirect_to(:action => 'login')
end
end

 private 
 def bitotsav_logged_in

 if session[:bitotsav]
 return true
 else
 redirect_to(:controller => 'bitotsav', :action => 'login')
 return false
 end



end
