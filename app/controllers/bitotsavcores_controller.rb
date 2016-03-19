class BitotsavcoresController < ApplicationController
  before_action :set_bitotsavcore, only: [:show, :edit, :update, :destroy]
  before_action :check_access_level
   after_action :allow_facebook_iframe
   def allow_facebook_iframe
    response.headers['X-Frame-Options'] = 'ALLOW-FROM https://bitotsav.in'
  end


  # GET /bitotsavcores
  # GET /bitotsavcores.json
  def index
    @bitotsavcores = Bitotsavcore.all
  end

  # GET /bitotsavcores/1
  # GET /bitotsavcores/1.json
  def show
  end

  # GET /bitotsavcores/new
  def new
    @bitotsavcore = Bitotsavcore.new
  end

  # GET /bitotsavcores/1/edit
  def edit
  end

  # POST /bitotsavcores
  # POST /bitotsavcores.json
  def create
    @bitotsavcore = Bitotsavcore.new(bitotsavcore_params)

    respond_to do |format|
      if @bitotsavcore.save
        format.html { redirect_to @bitotsavcore, notice: 'Bitotsavcore was successfully created.' }
        format.json { render :show, status: :created, location: @bitotsavcore }
      else
        format.html { render :new }
        format.json { render json: @bitotsavcore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bitotsavcores/1
  # PATCH/PUT /bitotsavcores/1.json
  def update
    respond_to do |format|
      if @bitotsavcore.update(bitotsavcore_params)
        format.html { redirect_to @bitotsavcore, notice: 'Bitotsavcore was successfully updated.' }
        format.json { render :show, status: :ok, location: @bitotsavcore }
      else
        format.html { render :edit }
        format.json { render json: @bitotsavcore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bitotsavcores/1
  # DELETE /bitotsavcores/1.json
  def destroy
    @bitotsavcore.destroy
    respond_to do |format|
      format.html { redirect_to bitotsavcores_url, notice: 'Bitotsavcore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bitotsavcore
      @bitotsavcore = Bitotsavcore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bitotsavcore_params
      params.require(:bitotsavcore).permit(:name, :email, :contact, :fblink)
    end



  

end
