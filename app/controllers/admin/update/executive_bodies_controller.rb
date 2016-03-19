class Admin::Update::ExecutiveBodiesController < ApplicationController

   layout "admin_update"

  before_action :set_admin_update_executive_body, only: [:show, :edit, :update, :destroy]
  before_action :check_access_level

  # GET /admin/update/executive_bodies
  # GET /admin/update/executive_bodies.json
  def index
    @admin_update_executive_bodies = Admin::Update::ExecutiveBody.all
  end

  # GET /admin/update/executive_bodies/1
  # GET /admin/update/executive_bodies/1.json
  def show
  end

  # GET /admin/update/executive_bodies/new
  def new
    @admin_update_executive_body = Admin::Update::ExecutiveBody.new
  end

  # GET /admin/update/executive_bodies/1/edit
  def edit
  end

  # POST /admin/update/executive_bodies
  # POST /admin/update/executive_bodies.json
  def create
    @admin_update_executive_body = Admin::Update::ExecutiveBody.new(admin_update_executive_body_params)

    respond_to do |format|
      if @admin_update_executive_body.save
        format.html { redirect_to @admin_update_executive_body, notice: 'Executive body was successfully created.' }
        format.json { render :show, status: :created, location: @admin_update_executive_body }
      else
        format.html { render :new }
        format.json { render json: @admin_update_executive_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/update/executive_bodies/1
  # PATCH/PUT /admin/update/executive_bodies/1.json
  def update
    respond_to do |format|
      if @admin_update_executive_body.update(admin_update_executive_body_params)
        format.html { redirect_to @admin_update_executive_body, notice: 'Executive body was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_update_executive_body }
      else
        format.html { render :edit }
        format.json { render json: @admin_update_executive_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/update/executive_bodies/1
  # DELETE /admin/update/executive_bodies/1.json
  def destroy
    @admin_update_executive_body.destroy
    respond_to do |format|
      format.html { redirect_to admin_update_executive_bodies_url, notice: 'Executive body was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_update_executive_body
      @admin_update_executive_body = Admin::Update::ExecutiveBody.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_update_executive_body_params
      params.require(:admin_update_executive_body).permit(:club, :name, :role, :role_first_char, :fb_link, :twitter_link, :contact)
    end
end
