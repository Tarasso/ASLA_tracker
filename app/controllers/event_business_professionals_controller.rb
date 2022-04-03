# frozen_string_literal: true

class EventBusinessProfessionalsController < ApplicationController
  before_action :set_event_business_professional, only: %i[show edit update destroy]
  before_action :student?, only: %i[register unregister]
  before_action :account_creating?, only: %i[index show new edit update destroy]

  # GET /event_business_professionals or /event_business_professionals.json
  def index
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
    @page_size = Integer((params[:page_size] || 10))
    @event_business_professionals = EventBusinessProfessional.select('event_business_professionals.id as id,
    org_name, first_name, name, last_name, email, date'
                                                                    ).joins(:event).joins(:business_professional)
    @event_business_professionals = @event_business_professionals.page(params[:page]).per(@page_size)
    @event_business_professionals = @event_business_professionals.order(params[:sort][:name] => params[:sort][:dir]) if params[:sort].present? && params[:sort].present?
    @event_business_professionals = @event_business_professionals.where('name LIKE ?', "%#{params[:q]}%") if params[:q].present? && params[:q].present?
  end

  # GET /event_business_professionals/1 or /event_business_professionals/1.json
  def show
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
  end

  # GET /event_business_professionals/new
  def new
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
    @event_business_professional = EventBusinessProfessional.new
  end

  # GET /event_business_professionals/1/edit
  def edit
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
  end

  def student?
    redirect_to(pages_unauthorized_path) unless session[:isBusinessProfessional] || session[:isAdmin]
  end

  def register
    @business_professional = BusinessProfessional.find(params[:bid])
    @event = Event.find(params[:eid])
    @event_business_professional = EventBusinessProfessional.new(business_professional_id: @business_professional.id, event_id: @event.id)
    respond_to do |format|
      if @event_business_professional.save
        format.html { redirect_to(events_business_professional_path(@business_professional), notice: 'You have registered.') }
        format.json { render(:show, status: :created, location: @event_business_professional) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @event_business_professional.errors, status: :unprocessable_entity) }
      end
    end
  end

  def unregister
    @business_professional = BusinessProfessional.find(params[:bid])
    @event = Event.find(params[:eid])
    @event_business_professional = EventBusinessProfessional.find_by(business_professional_id: @business_professional.id, event_id: @event.id)
    @event_business_professional.destroy!

    respond_to do |format|
      format.html { redirect_to(events_business_professional_path(@business_professional), notice: 'You have unregistered.') }
      format.json { head(:no_content) }
    end
  end

  # POST /event_business_professionals or /event_business_professionals.json
  def create
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
    @event_business_professional = EventBusinessProfessional.new(event_business_professional_params)

    respond_to do |format|
      if @event_business_professional.save
        format.html { redirect_to(event_business_professional_url(@event_business_professional), notice: 'Event business professional was successfully created.') }
        format.json { render(:show, status: :created, location: @event_business_professional) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @event_business_professional.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /event_business_professionals/1 or /event_business_professionals/1.json
  def update
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
    respond_to do |format|
      if @event_business_professional.update(event_business_professional_params)
        format.html { redirect_to(event_business_professional_url(@event_business_professional), notice: 'Event business professional was successfully updated.') }
        format.json { render(:show, status: :ok, location: @event_business_professional) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @event_business_professional.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /event_business_professionals/1 or /event_business_professionals/1.json
  def destroy
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
    @event_business_professional.destroy!

    respond_to do |format|
      format.html { redirect_to(event_business_professionals_url, notice: 'Event business professional was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event_business_professional
    @event_business_professional = EventBusinessProfessional.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_business_professional_params
    params.require(:event_business_professional).permit(:business_professional_id, :event_id)
  end
end
