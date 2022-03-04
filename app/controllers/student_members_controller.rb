# frozen_string_literal: true

class StudentMembersController < ApplicationController
  before_action :set_student_member, only: %i[show edit update destroy dashboard events]
  before_action :admin?, only: [:destroy]
  before_action :allowed_to_view?, only: %i[show edit update]

  # GET /student_members or /student_members.json
  def index
    @student_members = StudentMember.all
  end

  # GET /student_members/1 or /student_members/1.json
  def show; end

  def dashboard
    @student_member = StudentMember.find(params[:id])
  end

  def events
    @student_member = StudentMember.find(params[:id])
    @events = Event.all
    @event_student_members = EventStudentMember.all
  end

  # GET /student_members/new
  def new
    # nobody is allowed to create an account if their account already exists
    redirect_to(pages_unauthorized_path) unless session[:userID].nil?
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
        format.html { redirect_to(student_member_url(@student_member), notice: 'Student member was successfully created.') }
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
        format.html { redirect_to(student_member_url(@student_member), notice: 'Student member was successfully updated.') }
        format.json { render(:show, status: :ok, location: @student_member) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @student_member.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /student_members/1 or /student_members/1.json
  def destroy
    @student_member.destroy!

    respond_to do |format|
      format.html { redirect_to(student_members_url, notice: 'Student member was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student_member
    @student_member = StudentMember.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_member_params
    params.require(:student_member).permit(:uin, :first_name, :last_name, :class_year, :join_date, :member_title, :email, :phone_number,
                                           :expected_graduation_date, :social_point_amount, :meeting_point_amount, :fundraiser_point_amount,
                                           :informational_point_amount, :officer_title, :dues_paid, :picture, :uid
    )
  end
end
