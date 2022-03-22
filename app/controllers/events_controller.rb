# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  # GET /events or /events.json
  def index
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
  end

  # GET /events/new
  def new
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    redirect_to(pages_unauthorized_path) unless session[:isAdmin]
  end

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
