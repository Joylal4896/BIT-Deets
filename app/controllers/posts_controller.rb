class PostsController < ApplicationController

layout "main"

def index
	redirect_to '/'
end
	def show
		@allpost = Post.where("eventdatetime >= ?",  Time.now - 2.days).order('eventdatetime').all

		if params[:id]
		
			@post = Post.find(params[:id])
		else
		end


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

 def post_params
      params.require(:post).permit(:club,:title,:image1,:image2,:image3,:video1,:video2,:file1,:file2,:file3,:shortdesc,:longdesc,:category,:eventdatetime,:venue)
    end
end
