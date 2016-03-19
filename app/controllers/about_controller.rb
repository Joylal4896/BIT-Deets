class AboutController < ApplicationController
  
 layout "about"

  def index
  
  	@allpost = Post.where("eventdatetime >= ?",  Time.now - 1.days)

  end


end
