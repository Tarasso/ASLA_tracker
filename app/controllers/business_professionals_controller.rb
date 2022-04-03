# frozen_string_literal: true

class BusinessProfessionalsController < ApplicationController
  before_action :set_business_professional, only: %i[show edit update destroy]
  before_action :admin?, only: [:destroy]
  before_action :allowed_to_view_bpro?, only: %i[show edit update]
  before_action :business_member_event_delete, only: %i[destroy]
  before_action :business_member_event_attendance_delete, only: %i[destroy]
  after_action :event_business_member_delete, only: %i[attended]
  # GET /business_professionals or /business_professionals.json
  def index
    @page_size = Integer((params[:page_size] || 10))
    @business_professionals = BusinessProfessional.page(params[:page]).per(@page_size)
    @business_professionals = @business_professionals.order(params[:sort][:name] => params[:sort][:dir]) if params[:sort].present?
    if params[:q].present?
      @names = (params[:q]).split(" ")
      if @names.length() == 2
        @business_professionals = @business_professionals.where("first_name LIKE ? OR last_name LIKE ?", "%#{@names[0]}","%#{@names[1]}" )
      else
        @business_professionals = @business_professionals.where('first_name LIKE :search OR last_name LIKE :search OR email LIKE :search ', search: "%#{params[:q]}%")
      end
    end
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

  def events
    @business_professional = BusinessProfessional.find(params[:id])
    @events = Event.all
    @event_business_professional = EventBusinessProfessional.all
  end

  # POST /business_professionals or /business_professionals.json
  def create
    @business_professional = BusinessProfessional.new(business_professional_params)

    respond_to do |format|
      if @business_professional.save
        session[:isAdmin] = false
        session[:isBusinessProfessional] = BusinessProfessional.find_by(uid: session[:uid])
        session[:userID] = BusinessProfessional.where(uid: session[:uid]).pick(:id)
        session[:creatingAccount] = false
        format.html { redirect_to('/pages/user_dashboard') }
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
        format.json { render(:show, status: :ok, location: @business_professional) }
        if Integer(params[:id], 10) == session[:userID]
          format.html { redirect_to(pages_user_dashboard_path(@business_professional), notice: 'Account was successfully updated.') }
        else
          format.html { redirect_to(business_professional_path(@business_professional), notice: 'Account was successfully updated.') }
        end
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @business_professional.errors, status: :unprocessable_entity) }
      end
    end
  end

  def attended
    @business_professional = BusinessProfessional.find(params[:bid])
    @mem_attendance = BusinessAttendance.create!(business_professional_id: params[:bid], event_id: params[:eid])
    respond_to do |format|
      format.html { redirect_to(attended_events_business_professional_path(@business_professional), notice: 'Attendance confirmed.') }
    end
  end

  def event_business_member_delete
    @event_business_members = EventBusinessProfessional.find_by(business_professional_id: params[:bid], event_id: params[:eid])
    @event_business_members.destroy!
  end

  def business_member_event_delete
    @event_business_members = EventBusinessProfessional.where(business_professional_id: @business_professional.id)
    @event_business_members.each(&:destroy)
  end

  def business_member_event_attendance_delete
    @business_attendances = BusinessAttendance.where(business_professional_id: @business_professional.id)
    @business_attendances.each(&:destroy)
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
