# frozen_string_literal: true

class BusinessAttendancesController < ApplicationController
  before_action :set_business_attendance, only: %i[show edit update destroy]
  before_action :account_creating?, only: %i[index show new edit update destroy]
  before_action :admin?, only: %i[edit create update destroy new index show]

  # GET /business_attendances or /business_attendances.json
  def index
    redirect_to(pages_unauthorized_path) unless session[:isBusinessProfessional] || session[:isAdmin]
    @page_size = Integer((params[:page_size] || 10))
    @business_attendances = BusinessAttendance.select('business_attendances.id as id, org_name, first_name, name,  last_name, email, date').joins(:event).joins(:business_professional)
    @business_attendances = @business_attendances.page(params[:page]).per(@page_size)
    @business_attendances = @business_attendances.order(params[:sort][:name] => params[:sort][:dir]) if params[:sort].present? && params[:sort].present?
    @business_attendances.where("CONCAT_WS(' ', first_name, last_name) LIKE :search OR first_name LIKE :search OR last_name LIKE :search OR email LIKE :search OR name LIKE :search OR org_name LIKE :search", search: "%#{params[:q]}%") if params[:q].present? && params[:q].present?
  end

  # GET /business_attendances/1 or /business_attendances/1.json
  def show
    redirect_to(pages_unauthorized_path) unless session[:isBusinessProfessional] || session[:isAdmin]
  end

  # GET /business_attendances/new
  def new
    redirect_to(pages_unauthorized_path) unless session[:isBusinessProfessional] || session[:isAdmin]
    @business_attendance = BusinessAttendance.new
  end

  # GET /business_attendances/1/edit
  def edit
    redirect_to(pages_unauthorized_path) unless session[:isBusinessProfessional] || session[:isAdmin]
  end

  # POST /business_attendances or /business_attendances.json
  def create
    redirect_to(pages_unauthorized_path) unless session[:isBusinessProfessional] || session[:isAdmin]
    @business_attendance = BusinessAttendance.new(business_attendance_params)

    respond_to do |format|
      if @business_attendance.save
        format.html { redirect_to(business_attendance_url(@business_attendance), notice: 'Business attendance was successfully created.') }
        format.json { render(:show, status: :created, location: @business_attendance) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @business_attendance.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /business_attendances/1 or /business_attendances/1.json
  def update
    redirect_to(pages_unauthorized_path) unless session[:isBusinessProfessional] || session[:isAdmin]
    respond_to do |format|
      if @business_attendance.update(business_attendance_params)
        format.html { redirect_to(business_attendance_url(@business_attendance), notice: 'Business attendance was successfully updated.') }
        format.json { render(:show, status: :ok, location: @business_attendance) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @business_attendance.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /business_attendances/1 or /business_attendances/1.json
  def destroy
    redirect_to(pages_unauthorized_path) unless session[:isBusinessProfessional] || session[:isAdmin]
    @business_attendance.destroy!

    respond_to do |format|
      format.html { redirect_to(business_attendances_url, notice: 'Business attendance was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_business_attendance
    @business_attendance = BusinessAttendance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def business_attendance_params
    params.require(:business_attendance).permit(:business_professional_id, :event_id)
  end
end
