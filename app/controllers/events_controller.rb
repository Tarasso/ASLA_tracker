# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :event_student_member_delete, only: %i[destroy]
  before_action :event_business_member_delete, only: %i[destroy]
  before_action :event_student_attendance_delete, only: %i[destroy]
  before_action :event_business_attendance_delete, only: %i[destroy]
  # GET /events or /events.json
  def index
    @page_size = Integer((params[:page_size] || 10))
    @events = Event.page(params[:page]).per(@page_size)
    @events = @events.order(params[:sort][:name] => params[:sort][:dir]) if params[:sort].present?
    @events  = @events.where('LOWER(name) LIKE ?', "%#{params[:q]}%") if params[:q].present?
  end

  # GET /events/1 or /events/1.json
  def show; end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.event_code = rand(10_000..99_999)
    respond_to do |format|
      if @event.save
        format.html { redirect_to(event_url(@event), notice: 'Event was successfully created.') }
        format.json { render(:show, status: :created, location: @event) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to(event_url(@event), notice: 'Event was successfully updated.') }
        format.json { render(:show, status: :ok, location: @event) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  def event_student_member_delete
    @event_student_members = EventStudentMember.where(event_id: @event.id)
    @event_student_members.each(&:destroy)
  end

  def event_business_member_delete
    @event_business = EventBusinessProfessional.where(event_id: @event.id)
    @event_business.each(&:destroy)
  end

  def event_student_attendance_delete
    @event_student_members = MemberAttendance.where(event_id: @event.id)
    @event_student_members.each(&:destroy)
  end

  def event_business_attendance_delete
    @event_business = BusinessAttendance.where(event_id: @event.id)
    @event_business.each(&:destroy)
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!
    respond_to do |format|
      format.html { redirect_to(events_url, notice: 'Event was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:date, :name, :location, :start_time, :finish_time, :description, :event_type, :event_code)
  end
end
