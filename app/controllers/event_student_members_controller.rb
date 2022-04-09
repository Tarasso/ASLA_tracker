# frozen_string_literal: true

class EventStudentMembersController < ApplicationController
  before_action :set_event_student_member, only: %i[show edit update destroy]
  before_action :student?, only: %i[register unregister]
  before_action :account_creating?, only: %i[index show new edit update destroy]
  before_action :admin?, only: %i[index show new edit update destroy]
  # GET /event_student_members or /event_student_members.json
  def index
    @page_size = Integer((params[:page_size] || 10))
    @event_student_members = EventStudentMember.select('event_student_members.id as id, first_name, name, uin, last_name, email, date').joins(:event).joins(:student_member)
    @event_student_members = @event_student_members.page(params[:page]).per(@page_size)
    @event_student_members = @event_student_members.order(params[:sort][:name] => params[:sort][:dir]) if params[:sort].present? && params[:sort].present?
    @event_student_members.where("CONCAT_WS(' ', first_name, last_name) LIKE :search OR first_name LIKE :search OR last_name LIKE :search OR name LIKE :search OR email LIKE :search OR uin LIKE :search", search: "%#{params[:q]}%") if params[:q].present? && params[:q].present?
  end

  # GET /event_student_members/1 or /event_student_members/1.json
  def show; end

  # GET /event_student_members/new
  def new
    @event_student_member = EventStudentMember.new
  end

  # GET /event_student_members/1/edit
  def edit; end

  def register
    @student_member = StudentMember.find_by(uid: session[:uid])
    @event = Event.find(params[:eid])
    @event_student_member = EventStudentMember.new(student_member_id: @student_member.id, event_id: params[:eid])
    @event_student_member.save!
    respond_to do |format|
      if @event_student_member.save
        format.html { redirect_to('/pages/user_dashboard', notice: 'You have registered.', style: "float: right") }
        format.json { render(:show, status: :created, location: @event_student_member) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @event_student_member.errors, status: :unprocessable_entity) }
      end
    end
  end

  def unregister
    @student_member = StudentMember.find(params[:id])
    @event = Event.find(params[:eid])
    @event_student_member = EventStudentMember.find_by(student_member_id: @student_member.id, event_id: @event.id)
    @event_student_member.destroy!

    respond_to do |format|
      format.html { redirect_to('/pages/user_dashboard', notice: 'You have unregistered.', style: "float: right") }
      format.json { head(:no_content) }
    end
  end

  # POST /event_student_members or /event_student_members.json
  def create
    @event_student_member = EventStudentMember.new(event_student_member_params)

    respond_to do |format|
      if @event_student_member.save
        format.html { redirect_to(event_student_member_url(@event_student_member), notice: 'Event student member was successfully created.') }
        format.json { render(:show, status: :created, location: @event_student_member) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @event_student_member.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /event_student_members/1 or /event_student_members/1.json
  def update
    respond_to do |format|
      if @event_student_member.update(event_student_member_params)
        format.html { redirect_to(event_student_member_url(@event_student_member), notice: 'Event student member was successfully updated.') }
        format.json { render(:show, status: :ok, location: @event_student_member) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @event_student_member.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /event_student_members/1 or /event_student_members/1.json
  def destroy
    @event_student_member.destroy!

    respond_to do |format|
      format.html { redirect_to(event_student_members_url, notice: 'Event student member was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event_student_member
    @event_student_member = EventStudentMember.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_student_member_params
    params.require(:event_student_member).permit(:student_member_id, :event_id)
  end
end
