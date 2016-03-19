class ClubsController < ApplicationController

layout "clubs"
def index

redirect_to('/')

end

def new
	@sms = SubscribeSm.new
	@email = SubscribeEmail.new

end

def view
	if params[:id]
	
	@club = Admin::Update::Club.where( :shortname => params[:id]).first
	@exbody = Admin::Update::ExecutiveBody.where( :club => params[:id]).all
	@posts = Post.where("eventdatetime > ?", Time.now - 200.days).where(:club => params[:id]).order('created_at DESC').all
	@allpost = Post.where("eventdatetime > ?", Time.now - 1.day).all
	@email = Email.new
	else
	redirect_to('/')
	end


end



end
