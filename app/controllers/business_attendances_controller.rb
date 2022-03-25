# frozen_string_literal: true

class BusinessAttendancesController < ApplicationController
  before_action :set_business_attendance, only: %i[show edit update destroy]

  # GET /business_attendances or /business_attendances.json
  def index
    @business_attendances = BusinessAttendance.all
  end

  # GET /business_attendances/1 or /business_attendances/1.json
  def show; end

  # GET /business_attendances/new
  def new
    @business_attendance = BusinessAttendance.new
  end

  # GET /business_attendances/1/edit
  def edit; end

  # POST /business_attendances or /business_attendances.json
  def create
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
    params.require(:business_attendance).permit(:organization_id, :event_id)
  end
end
