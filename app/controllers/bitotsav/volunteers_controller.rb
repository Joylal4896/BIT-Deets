class Bitotsav::VolunteersController < ApplicationController
  
 
  before_action :bitotsav_logged_in
  before_action :set_bitotsav_volunteer, only: [:show, :edit, :update, :destroy]
   after_action :allow_facebook_iframe
   

  def allow_facebook_iframe
    response.headers['X-Frame-Options'] = 'ALLOW-FROM https://bitotsav.in'
  end



  layout "volunteers"

  # GET /bitotsav/volunteers
  # GET /bitotsav/volunteers.json
  def index
    if session[:bitotsav] == "Admins"
    @bitotsav_volunteers = Bitotsav::Volunteer.all
  else
    @bitotsav_volunteers = Bitotsav::Volunteer.where(:team => session[:bitotsav]).all
  end
  end

  # GET /bitotsav/volunteers/1
  # GET /bitotsav/volunteers/1.json
  def show
  end

  # GET /bitotsav/volunteers/new
  def new
    @bitotsav_volunteer = Bitotsav::Volunteer.new
  end

  # GET /bitotsav/volunteers/1/edit
  def edit
  end

  # POST /bitotsav/volunteers
  # POST /bitotsav/volunteers.json
  def create
    @bitotsav_volunteer = Bitotsav::Volunteer.new(bitotsav_volunteer_params)
    if @bitotsav_volunteer.Team == session[:bitotsav] || session[:bitotsav] == "Admins"
    respond_to do |format|
      if @bitotsav_volunteer.save
        format.html { redirect_to @bitotsav_volunteer, notice: 'Volunteer was successfully created.' }
        format.json { render :show, status: :created, location: @bitotsav_volunteer }
      else
        format.html { render :new }
        format.json { render json: @bitotsav_volunteer.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to '/bitotsav/volunteers'
    end
  end

  # PATCH/PUT /bitotsav/volunteers/1
  # PATCH/PUT /bitotsav/volunteers/1.json
  def update
    if @bitotsav_volunteer.Team == session[:bitotsav] || session[:bitotsav] == "Admins"
    respond_to do |format|
      if @bitotsav_volunteer.update(bitotsav_volunteer_params)
        format.html { redirect_to @bitotsav_volunteer, notice: 'Volunteer was successfully updated.' }
        format.json { render :show, status: :ok, location: @bitotsav_volunteer }
      else
        format.html { render :edit }
        format.json { render json: @bitotsav_volunteer.errors, status: :unprocessable_entity }
      end
      
    end
    else
      redirect_to '/bitotsav/volunteers'
    end
  end

  # DELETE /bitotsav/volunteers/1
  # DELETE /bitotsav/volunteers/1.json
  def destroy
    if @bitotsav_volunteer.Team == session[:bitotsav] || session[:bitotsav] == "Admins"
    @bitotsav_volunteer.destroy
    respond_to do |format|
      format.html { redirect_to bitotsav_volunteers_url, notice: 'Volunteer was successfully destroyed.' }
      format.json { head :no_content }
    end
    else
      redirect_to '/bitotsav/volunteers'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bitotsav_volunteer
      @bitotsav_volunteer = Bitotsav::Volunteer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bitotsav_volunteer_params
      params.require(:bitotsav_volunteer).permit(:Name, :Role, :Rating, :Activity, :Team)
    end

    private 
 def bitotsav_logged_in

 if session[:bitotsav]
 return true
 else
 redirect_to('/bitotsav/login')
 return false
 end
end


end
