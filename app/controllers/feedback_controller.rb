class FeedbackController < ApplicationController

before_action :check_access_level, :except => [:new , :create]
	
layout "feedack"


	def new
	@feedback = Feedback.new
	@allpost = Post.where("eventdatetime >= ?",  Time.now - 1.days)
	end

	def create 

		@feedback = Feedback.new(feedback_params)

		if @feedback.save
			flash[:notice] = "Feedback submitted, your suggestions are valuable to us"
			redirect_to('/feedback')
		else
			flash[:notice] = "Feedback could not be submitted, database error | Contact admin "
			redirect_to('/feedback')
		end
	end

	def view
		@feedback = Feedback.all
	end

	private
	def feedback_params
      params.require(:feedback).permit(:name, :rollno, :branch, :email, :phoneno, :feedback, :putmore, :contactvia)
    end
end
