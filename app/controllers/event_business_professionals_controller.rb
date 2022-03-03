# frozen_string_literal: true

class EventBusinessProfessionalsController < ApplicationController
  before_action :set_event_business_professional, only: %i[show edit update destroy]

  # GET /event_business_professionals or /event_business_professionals.json
  def index
    @event_business_professionals = EventBusinessProfessional.all
  end

  # GET /event_business_professionals/1 or /event_business_professionals/1.json
  def show; end

  # GET /event_business_professionals/new
  def new
    @event_business_professional = EventBusinessProfessional.new
  end

  # GET /event_business_professionals/1/edit
  def edit; end

  # POST /event_business_professionals or /event_business_professionals.json
  def create
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
    params.require(:event_business_professional).permit(:organization_id, :event_id)
  end
end
