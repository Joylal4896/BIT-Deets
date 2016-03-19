class Signup < ApplicationMailer

	default :from => "donot-reply@bitdeets.in"

 def registration_confirmation(user)
   
    @user = user

    mail(:to => @user.mail, :subject => "BIT DEETS | Registration Confirmation")

end

end
