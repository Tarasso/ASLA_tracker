# frozen_string_literal: true

class MemberAttendancesController < ApplicationController
  before_action :set_member_attendance, only: %i[show edit update destroy]

  # GET /member_attendances or /member_attendances.json
  def index
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
    @member_attendances = MemberAttendance.all
  end

  # GET /member_attendances/1 or /member_attendances/1.json
  def show
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
  end

  # GET /member_attendances/new
  def new
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
    @member_attendance = MemberAttendance.new
  end

  # GET /member_attendances/1/edit
  def edit
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
  end

  # POST /member_attendances or /member_attendances.json
  def create
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
    @member_attendance = MemberAttendance.new(member_attendance_params)

    respond_to do |format|
      if @member_attendance.save
        format.html { redirect_to(member_attendance_url(@member_attendance), notice: 'Member attendance was successfully created.') }
        format.json { render(:show, status: :created, location: @member_attendance) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @member_attendance.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /member_attendances/1 or /member_attendances/1.json
  def update
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
    respond_to do |format|
      if @member_attendance.update(member_attendance_params)
        format.html { redirect_to(member_attendance_url(@member_attendance), notice: 'Member attendance was successfully updated.') }
        format.json { render(:show, status: :ok, location: @member_attendance) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @member_attendance.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /member_attendances/1 or /member_attendances/1.json
  def destroy
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
    @member_attendance.destroy!

    respond_to do |format|
      format.html { redirect_to(member_attendances_url, notice: 'Member attendance was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member_attendance
    @member_attendance = MemberAttendance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def member_attendance_params
    params.require(:member_attendance).permit(:member_id, :event_id, :point_type)
  end
end
