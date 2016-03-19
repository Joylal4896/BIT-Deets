class AdminController < ApplicationController
require 'carrierwave/orm/activerecord'
layout "admin"


 before_action :confirm_logged_in, :except => [:login, :logout, :attempt_login]
def index
	@mode = "index"
	@post = Post.new
	@allpost = Post.where("eventdatetime > ?", Time.now).order('eventdatetime').all
	@userpost = Post.where(:club => session[:username])


end

def login

  if session[:username]
    redirect_to '/admin'
  else
  end

end

def attempt_login

	if params[:username].present? && params[:password].present?
		found_user = Admin.where(:username => params[:username]).first
	if found_user
		authorised_user = found_user.authenticate(params[:password])
	end
	end

 	if authorised_user
	session[:user_id] = authorised_user.id
	session[:username] = authorised_user.username 
        session[:access_level] = authorised_user.username
        redirect_to(:action => 'index')
	else
	flash[:notice] = "Invalid username/password"
	redirect_to(:action => login)
	end


end
   
def logout

	session[:user_id] = nil
        session[:username] = nil
	response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    	response.headers["Pragma"] = "no-cache"
    	response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
	flash[:notice] = "Logged out | Please RELOAD the page to login again"
	redirect_to(:action => 'login')
end

def create_post
  @post = Post.new(post_params)
   @post.created_at = Time.now + 5.hours + 30.minutes
  if @post.save
    redirect_to '/posts/'+@post.id.to_s
  else
      end
end


def edit
	@post = Post.find(params[:id])
	@allpost = Post.where("eventdatetime > ?", Time.now).order('eventdatetime').all
	@userpost = Post.where(:club => session[:username])
	
	@mode = "edit"
	render "index"
end

def update
    @post = Post.find(params[:id])
    if @post.club == session[:username] || session[:username] == "Joy"
        
         if @post.update(post_params)
        redirect_to '/admin'
        flash[:notice] = "Post Updated successfully Visit new post here : http://bitdeets.in/posts/"+@post.id.to_s
      else
        
     redirect_to '/admin'
        flash[:notice] = "Unable to Update "
      end
    else
      redirect_to '/admin'
        flash[:notice] = "Unauthorised"
    end
    
 end

  def destroy

  	@post = Post.find(params[:id])

    if @post.club == session[:username] || session[:username] == "Joy"
    if @post.destroy
    flash[:notice]  = "Post successfully deleted"
    redirect_to '/admin'

	else
   
   	redirect_to '/admin'
      flash[:notice]  = "Unable to delete"

    end 
  else
      redirect_to '/admin'
      flash[:notice]  = "Action Unauthorised"
    end 
  end

  def change_password



	if params[:newpassword].present? && params[:password].present? && params[:confirmnewpassword].present?
    	if  params[:newpassword] ==  params[:confirmnewpassword]
    		found_user = Admin.where(:username => session[:username]).first
  				if found_user
    				authorised_user = found_user.authenticate(params[:password])
  				end
		else
  		flash[:notice] = "Password and Confirm Password donot match"
  		redirect_to '/admin' and return
		end
	end

    if authorised_user
    
    		if found_user.update(:password => params[:newpassword])
      
      		flash[:notice] = "Password change successfully, Note: you will not be logged out of session on other browsers unless you logout"
      		redirect_to '/admin' and return
    	else
  			flash[:notice] = "Password cannot be changed at the moment"
  			redirect_to '/admin' and return
  		end
  	else
  		flash[:notice] = "Password incorrect"
  		redirect_to '/admin' and return
  	end

end




	
private

	def post_params
      params.require(:post).permit(:club,:title,:image1,:image2,:image3,:video1,:video2,:file1,:file2,:file3,:shortdesc,:longdesc,:category,:eventdatetime,:venue)
    end





end



