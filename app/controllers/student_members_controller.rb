# frozen_string_literal: true

class StudentMembersController < ApplicationController
  before_action :set_student_member, only: %i[show edit update destroy events]
  before_action :admin?, only: [:destroy]
  before_action :account_creating?, only: %i[index attended events edit show]
  before_action :allowed_to_view_student?, only: %i[edit update]
  before_action :allowed_to_view_student_info?, only: [:show]
  before_action :points_add, only: %i[eventcode]
  before_action :student_member_event_delete, only: %i[destroy]
  before_action :student_event_attendance_delete, only: %i[destroy]
  after_action :attended, only: %i[eventcode]
  after_action :event_student_member_delete, only: %i[eventcode]
  after_action :req_points, only: %i[index]
  after_action :reset_values, only: %i[index]

  def reset_values
    if params.key?(:dues) || params.key?(:points)

      @group1 = params[:dues]
      @group2 = params[:points]

      @student_members = StudentMember.all

      if @group1 == 'dues'
        @student_members.each do |student|
          student.update!(dues_paid: false)
        end
      end
      if @group2 == 'points'
        @student_members.each do |student|
          student.update!(meeting_point_amount: 0)
          student.update!(social_point_amount: 0)
          student.update!(informational_point_amount: 0)
          student.update!(fundraiser_point_amount: 0)
        end
      end
    end
  end

  # GET /student_members or /student_members.json
  def index
    @page_size = Integer((params[:page_size] || 10))
    @student_members = StudentMember.page(params[:page]).per(@page_size)
    @student_members = @student_members.order(params[:sort][:name] => params[:sort][:dir]) if params[:sort].present?
    @student_members = @student_members.where("CONCAT_WS(' ',first_name, last_name) LIKE :search OR first_name LIKE :search OR last_name LIKE :search OR email LIKE :search", search: "%#{params[:q]}%") if params[:q].present?
  end

  def req_points
    if params.key?(:required_points)
      @group3 = params[:required_points]
      File.open('global_variables.txt', 'w') { |f| f.write(@group3) } if @group3
    end
  end

  # GET /student_members/1 or /student_members/1.json
  def show; end

  def events
    @student_member = if StudentMember.find_by(id: params[:id])
                        StudentMember.find(params[:id])
                      else
                        StudentMember.find_by(uid: session[:uid])
                      end
    @events = Event.where('finish_time > ?', Time.zone.now)
    @events_all = Event.all
    @event_student_members = EventStudentMember.all
  end

  # GET /student_members/new
  def new
    # nobody is allowed to create an account if their account already exists
    @student_member = StudentMember.new
  end

  # GET /student_members/1/edit
  def edit; end

  # POST /student_members or /student_members.json
  def create
    @student_member = StudentMember.new(student_member_params)

    respond_to do |format|
      if @student_member.save
        session[:isAdmin] = StudentMember.where(uid: session[:uid]).pick(:member_title) == 'officer'
        session[:isMember] = StudentMember.find_by(uid: session[:uid])
        session[:userID] = StudentMember.where(uid: session[:uid]).pick(:id)
        session[:creatingAccount] = false
        format.html { redirect_to('/pages/user_dashboard') }
        format.json { render(:show, status: :created, location: @student_member) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @student_member.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /student_members/1 or /student_members/1.json
  def update
    respond_to do |format|
      if @student_member.update(student_member_params)
        format.json { render(:show, status: :ok, location: @student_member) }
        @total_points = @student_member.meeting_point_amount + @student_member.fundraiser_point_amount + @student_member.social_point_amount + @student_member.informational_point_amount
        @student_member.update!(total_points: @total_points)
        if Integer(params[:id], 10) == session[:userID]
          format.html { redirect_to(pages_user_dashboard_path(@student_member), notice: 'Account was successfully updated.') }
        else
          format.html { redirect_to(student_member_path(@student_member), notice: 'Account was successfully updated.') }
        end
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @student_member.errors, status: :unprocessable_entity) }
      end
    end
  end

  def points_add
    @student_member = StudentMember.find(params[:mid])
    @meeting_points = @student_member.meeting_point_amount + 1
    @social_points = @student_member.social_point_amount + 1
    @informational_points = @student_member.informational_point_amount + 1
    @fundraising_points = @student_member.fundraiser_point_amount + 1
  end

  def attended
    @event = Event.find(params[:eid])
    @ec = params[:event_code_entered]
    @ec_i = Integer(@ec, 10)
    @student_member = StudentMember.find(params[:mid])
    @mem_attendance = MemberAttendance.new(student_member_id: params[:mid], event_id: params[:eid])
    if (@ec_i == @event.event_code) && (@event.event_type == 'meeting')
      @mem_attendance.update!(point_type: 'meeting')
    elsif (@ec_i == @event.event_code) && (@event.event_type == 'social')
      @mem_attendance.update!(point_type: 'social')
    elsif (@ec_i == @event.event_code) && (@event.event_type == 'informational')
      @mem_attendance.update!(point_type: 'informational')
    elsif (@ec_i == @event.event_code) && (@event.event_type == 'fundraising')
      @mem_attendance.update!(point_type: 'fundraising')
    end
    @total_points = @student_member.meeting_point_amount + @student_member.fundraiser_point_amount + @student_member.social_point_amount + @student_member.informational_point_amount
    @student_member.update!(total_points: @total_points)
  end

  def event_student_member_delete
    @event = Event.find(params[:eid])
    @ec = params[:event_code_entered]
    @ec_i = Integer(@ec, 10)
    if @ec_i == @event.event_code
      @event_student_members = EventStudentMember.find_by(student_member_id: params[:mid], event_id: params[:eid])
      @event_student_members.destroy!
    end
  end

  def eventcode
    @event = Event.find(params[:eid])
    @ec = params[:event_code_entered]
    @ec_i = Integer(@ec, 10)
    @student_member = StudentMember.find(params[:mid])
    respond_to do |format|
      if (@ec_i == @event.event_code) && (@event.event_type == 'meeting')
        @student_member.update!(meeting_point_amount: @meeting_points)
        format.html { redirect_to(events_student_member_path(@student_member), notice: 'Points have been updated') }
      elsif (@ec_i == @event.event_code) && (@event.event_type == 'social')
        @student_member.update!(social_point_amount: @social_points)
        format.html { redirect_to(events_student_member_path(@student_member), notice: 'Points have been updated') }
      elsif (@ec_i == @event.event_code) && (@event.event_type == 'informational')
        @student_member.update!(informational_point_amount: @informational_points)
        format.html { redirect_to(events_student_member_path(@student_member), notice: 'Points have been updated') }
      elsif (@ec_i == @event.event_code) && (@event.event_type == 'fundraising')
        @student_member.update!(fundraiser_point_amount: @fundraising_points)
        format.html { redirect_to(events_student_member_path(@student_member), notice: 'Points have been updated') }
      else
        Rails.logger.debug(@event.event_type)
        format.html { redirect_to(events_student_member_path(@student_member), notice: 'Incorrect Code entered') }
      end
    end
  end

  def student_member_event_delete
    @event_student_members = EventStudentMember.where(student_member_id: @student_member.id)
    @event_student_members.each(&:destroy)
  end

  def student_event_attendance_delete
    @member_attendances = MemberAttendance.where(student_member_id: @student_member.id)
    @member_attendances.each(&:destroy)
  end

  # DELETE /student_members/1 or /student_members/1.json
  def destroy
    @student_member.destroy!

    respond_to do |format|
      format.html { redirect_to(student_members_url, notice: 'Student member was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  def search
    @student_members = StudentMember.search(params[:q])
    render('index')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student_member
    @student_member = if StudentMember.find_by(id: params[:id])
                        StudentMember.find(params[:id])
                      else
                        StudentMember.find_by(uid: session[:uid])
                      end
  end

  # Only allow a list of trusted parameters through.
  def student_member_params
    params.require(:student_member).permit(:uin, :first_name, :last_name, :class_year, :join_date, :member_title, :email, :phone_number,
                                           :expected_graduation_date, :social_point_amount, :meeting_point_amount, :fundraiser_point_amount,
                                           :informational_point_amount, :officer_title, :dues_paid, :picture, :uid, :program_level, :student_classification
    )
  end
end
