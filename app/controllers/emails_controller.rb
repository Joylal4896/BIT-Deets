# encoding: utf-8
class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]
  
  # GET /emails
  # GET /emails.json


  before_action :confirm_logged_in, :except => [:create, :confirm]
  before_action :check_access_level, :except => [:create, :confirm]
  def index
    @emails = Email.all
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new(email_params)
    @email.confirmation = "Pending"
    @email.password_digest = SecureRandom.urlsafe_base64.to_s

	
      if @email.save
        if 
          Signup.registration_confirmation(@email).deliver_now
       else
         flash[:notice] = "Invalid Credentials"
       end
      else 
        flash[:notice] = "Error delivering email, please check if the email address was correct and all fiels were properly filled . Contact admin if the problem persists"
	 end 
     
end

    def confirm

      @user = Email.where(:password_digest => params[:id]).first

      if(@user)
        flash[:notice] = "Registeration Confirmed"
        @user.confirmation = "Confirmed"
        @user.save
      else
        flash[:notice] = "Registeration could not be confirmed at the moment please ensure that the links are correct."
        redirect_to '/'
      end


end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @email, notice: 'Email was successfully updated.' }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:mail, :name, :club, :password, :confirmation)
    end


	
end
