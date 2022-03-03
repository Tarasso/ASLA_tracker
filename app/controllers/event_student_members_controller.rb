class EventStudentMembersController < ApplicationController
  before_action :set_event_student_member, only: %i[ show edit update destroy ]

  # GET /event_student_members or /event_student_members.json
  def index
    @event_student_members = EventStudentMember.all
  end

  # GET /event_student_members/1 or /event_student_members/1.json
  def show
  end

  # GET /event_student_members/new
  def new
    @event_student_member = EventStudentMember.new
  end

  # GET /event_student_members/1/edit
  def edit
  end

  def register
    @student_member = StudentMember.find(params[:mid])
    @event = Event.find(params[:eid])
    @event_student_member = EventStudentMember.new(member_id: @student_member.id, event_id: @event.id)
    respond_to do |format|
      if @event_student_member.save
        format.html { redirect_to events_student_member_path(@student_member), notice: "You have registered." }
        format.json { render :show, status: :created, location: @event_student_member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_student_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def unregister
    @student_member = StudentMember.find(params[:mid])
    @event = Event.find(params[:eid])
    @event_student_member = EventStudentMember.find_by(member_id: @student_member.id, event_id: @event.id)
    @event_student_member.destroy

    respond_to do |format|
      format.html { redirect_to events_student_member_path(@student_member), notice: "You have unregistered." }
      format.json { head :no_content }
    end
  end
  # POST /event_student_members or /event_student_members.json
  def create
    @event_student_member = EventStudentMember.new(event_student_member_params)

    respond_to do |format|
      if @event_student_member.save
        format.html { redirect_to event_student_member_url(@event_student_member), notice: "Event student member was successfully created." }
        format.json { render :show, status: :created, location: @event_student_member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_student_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_student_members/1 or /event_student_members/1.json
  def update
    respond_to do |format|
      if @event_student_member.update(event_student_member_params)
        format.html { redirect_to event_student_member_url(@event_student_member), notice: "Event student member was successfully updated." }
        format.json { render :show, status: :ok, location: @event_student_member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_student_member.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /event_student_members/1 or /event_student_members/1.json
  def destroy
    @event_student_member.destroy

    respond_to do |format|
      format.html { redirect_to event_student_members_url, notice: "Event student member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_student_member
      @event_student_member = EventStudentMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_student_member_params
      params.require(:event_student_member).permit(:member_id, :event_id)
    end
end
