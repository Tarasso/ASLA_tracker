# frozen_string_literal: true

class CarouselsController < ApplicationController
  before_action :set_carousel, only: %i[show edit update destroy]
  before_action :admin?, only: %i[index show new edit update destroy]

  # GET /carousels or /carousels.json
  def index
    @carousels = Carousel.all
  end

  # GET /carousels/1 or /carousels/1.json
  def show; end

  # GET /carousels/new
  def new
    @carousel = Carousel.new
  end

  # GET /carousels/1/edit
  def edit; end

  # POST /carousels or /carousels.json
  def create
    @carousel = Carousel.new(carousel_params)

    respond_to do |format|
      if @carousel.save
        format.html { redirect_to(carousel_url(@carousel), notice: 'Carousel was successfully created.') }
        format.json { render(:show, status: :created, location: @carousel) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @carousel.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /carousels/1 or /carousels/1.json
  def update
    respond_to do |format|
      if @carousel.update(carousel_params)
        format.html { redirect_to(carousel_url(@carousel), notice: 'Carousel was successfully updated.') }
        format.json { render(:show, status: :ok, location: @carousel) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @carousel.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /carousels/1 or /carousels/1.json
  def destroy
    @carousel.destroy!

    respond_to do |format|
      format.html { redirect_to(carousels_url, notice: 'Carousel was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_carousel
    @carousel = Carousel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def carousel_params
    params.require(:carousel).permit(:pic_name, :image)
  end
end
