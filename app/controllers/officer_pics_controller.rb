# frozen_string_literal: true

class OfficerPicsController < ApplicationController
  before_action :set_officer_pic, only: %i[show edit update destroy]
  before_action :admin?, only: %i[index show new edit update destroy]

  # GET /officer_pics or /officer_pics.json
  def index
    @officer_pics = OfficerPic.all
  end

  # GET /officer_pics/1 or /officer_pics/1.json
  def show; end

  # GET /officer_pics/new
  def new
    @officer_pic = OfficerPic.new
  end

  # GET /officer_pics/1/edit
  def edit; end

  # POST /officer_pics or /officer_pics.json
  def create
    @officer_pic = OfficerPic.new(officer_pic_params)

    respond_to do |format|
      if @officer_pic.save
        format.html { redirect_to(officer_pic_url(@officer_pic), notice: 'Officer pic was successfully created.') }
        format.json { render(:show, status: :created, location: @officer_pic) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @officer_pic.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /officer_pics/1 or /officer_pics/1.json
  def update
    respond_to do |format|
      if @officer_pic.update(officer_pic_params)
        format.html { redirect_to(officer_pic_url(@officer_pic), notice: 'Officer pic was successfully updated.') }
        format.json { render(:show, status: :ok, location: @officer_pic) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @officer_pic.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /officer_pics/1 or /officer_pics/1.json
  def destroy
    @officer_pic.destroy!

    respond_to do |format|
      format.html { redirect_to(officer_pics_url, notice: 'Officer pic was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_officer_pic
    @officer_pic = OfficerPic.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def officer_pic_params
    params.require(:officer_pic).permit(:name, :officer_title, :image)
  end
end
