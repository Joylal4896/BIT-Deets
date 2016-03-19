class Admin::Update::ClubsController < ApplicationController
 
  layout "admin_update"
  before_action :set_admin_update_club, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in
  before_action :check_access_level

  # GET /admin/update/clubs
  # GET /admin/update/clubs.json
  def index
    @admin_update_clubs = Admin::Update::Club.all
  end

  # GET /admin/update/clubs/1
  # GET /admin/update/clubs/1.json
  def show
  end

  # GET /admin/update/clubs/new
  def new
    @admin_update_club = Admin::Update::Club.new
  end

  # GET /admin/update/clubs/1/edit
  def edit
  end

  # POST /admin/update/clubs
  # POST /admin/update/clubs.json
  def create
    @admin_update_club = Admin::Update::Club.new(admin_update_club_params)

    respond_to do |format|
      if @admin_update_club.save
        format.html { redirect_to @admin_update_club, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @admin_update_club }
      else
        format.html { render :new }
        format.json { render json: @admin_update_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/update/clubs/1
  # PATCH/PUT /admin/update/clubs/1.json
  def update
    respond_to do |format|
      if @admin_update_club.update(admin_update_club_params)
        format.html { redirect_to @admin_update_club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_update_club }
      else
        format.html { render :edit }
        format.json { render json: @admin_update_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/update/clubs/1
  # DELETE /admin/update/clubs/1.json
  def destroy
    @admin_update_club.destroy
    respond_to do |format|
      format.html { redirect_to admin_update_clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_update_club
      @admin_update_club = Admin::Update::Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_update_club_params
      params.require(:admin_update_club).permit(:shortname, :clubname, :clubdesc, :clubweblink, :videolink, :clubquote, :imagelink)
    end
end

