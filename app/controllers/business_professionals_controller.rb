# frozen_string_literal: true

class BusinessProfessionalsController < ApplicationController
  before_action :set_business_professional, only: %i[show edit update destroy]
  before_action :admin?, only: [:destroy]
  before_action :allowed_to_view?, only: %i[show edit update]

  # GET /business_professionals or /business_professionals.json
  def index
    @business_professionals = BusinessProfessional.all
  end

  # GET /business_professionals/1 or /business_professionals/1.json
  def show; end

  # GET /business_professionals/new
  def new
    redirect_to(pages_unauthorized_path) unless session[:userID].nil?
    @business_professional = BusinessProfessional.new
  end

  # GET /business_professionals/1/edit
  def edit; end

  # POST /business_professionals or /business_professionals.json
  def create
    @business_professional = BusinessProfessional.new(business_professional_params)

    respond_to do |format|
      if @business_professional.save
        session[:isAdmin] = false
        session[:userID] = BusinessProfessional.where(uid: session[:uid]).pick(:id)
        format.html { redirect_to(business_professional_url(@business_professional), notice: 'Business professional was successfully created.') }
        format.json { render(:show, status: :created, location: @business_professional) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @business_professional.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /business_professionals/1 or /business_professionals/1.json
  def update
    respond_to do |format|
      if @business_professional.update(business_professional_params)
        format.html { redirect_to(pages_user_dashboard_path(@business_professional), notice: 'Account was successfully updated.') }
        format.json { render(:show, status: :ok, location: @business_professional) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @business_professional.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /business_professionals/1 or /business_professionals/1.json
  def destroy
    @business_professional.destroy!

    respond_to do |format|
      format.html { redirect_to(business_professionals_url, notice: 'Business professional was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  def search
    @business_professionals = BusinessProfessional.search(params[:q])
    render('index')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_business_professional
    @business_professional = BusinessProfessional.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def business_professional_params
    params.require(:business_professional).permit(:org_name, :first_name, :last_name, :phone_num, :email)
  end
end
