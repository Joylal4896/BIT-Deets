class Bitotsav::OrganisersController < ApplicationController
  
  
  before_action :bitotsav_logged_in
  before_action :set_bitotsav_organiser, only: [:show, :edit, :update, :destroy]
   after_action :allow_facebook_iframe
   

  def allow_facebook_iframe
    response.headers['X-Frame-Options'] = 'ALLOW-FROM https://bitotsav.in'
  end



  layout "organisers"

  # GET /bitotsav/organisers
  # GET /bitotsav/organisers.json
  def index
    if session[:bitotsav] == "Admins"
      @bitotsav_organisers = Bitotsav::Organiser.all
    else
    @bitotsav_organisers = Bitotsav::Organiser.where(:team => session[:bitotsav]).all
  end
  end

  # GET /bitotsav/organisers/1
  # GET /bitotsav/organisers/1.json
  def show
  end

  # GET /bitotsav/organisers/new
  def new
    @bitotsav_organiser = Bitotsav::Organiser.new
  end

  # GET /bitotsav/organisers/1/edit
  def edit
  end

  # POST /bitotsav/organisers
  # POST /bitotsav/organisers.json
  def create
    @bitotsav_organiser = Bitotsav::Organiser.new(bitotsav_organiser_params)
    if @bitotsav_organiser.Team == session[:bitotsav] || session[:bitotsav] == "Admins"
    respond_to do |format|
      if @bitotsav_organiser.save
        format.html { redirect_to @bitotsav_organiser, notice: 'Organiser was successfully created.' }
        format.json { render :show, status: :created, location: @bitotsav_organiser }
      else
        format.html { render :new }
        format.json { render json: @bitotsav_organiser.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to '/bitotsav/organisers'
    end
  end

  # PATCH/PUT /bitotsav/organisers/1
  # PATCH/PUT /bitotsav/organisers/1.json
  def update
    if @bitotsav_organiser.Team == session[:bitotsav] || session[:bitotsav] == "Admins"
    respond_to do |format|
      if @bitotsav_organiser.update(bitotsav_organiser_params)
        format.html { redirect_to @bitotsav_organiser, notice: 'Organiser was successfully updated.' }
        format.json { render :show, status: :ok, location: @bitotsav_organiser }
      else
        format.html { render :edit }
        format.json { render json: @bitotsav_organiser.errors, status: :unprocessable_entity }
      end
      end
    else
      redirect_to '/bitotsav/organisers'
    end
    
  end

  # DELETE /bitotsav/organisers/1
  # DELETE /bitotsav/organisers/1.json
  def destroy
    if @bitotsav_organiser.Team == session[:bitotsav] || session[:bitotsav] == "Admins"
    @bitotsav_organiser.destroy
    respond_to do |format|
      format.html { redirect_to bitotsav_organisers_url, notice: 'Organiser was successfully destroyed.' }
      format.json { head :no_content }
    end
  else
      redirect_to '/bitotsav/organisers'
    end 
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bitotsav_organiser
      @bitotsav_organiser = Bitotsav::Organiser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bitotsav_organiser_params
      params.require(:bitotsav_organiser).permit(:Name, :Role, :Rating, :Activity, :Team)
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
