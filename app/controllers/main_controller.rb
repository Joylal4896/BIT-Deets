class MainController < ApplicationController

  layout "main"

  def index
  
  @post = Post.where("eventdatetime >= ?",  Time.now - 12.hours).order('eventdatetime').all
  @allpost = Post.where("eventdatetime > ?", Time.now).order('eventdatetime').all
  
  end
  



end














