class AttachedsController < ApplicationController
  before_action :set_attached, only: [:show, :edit, :update, :destroy]
  layout 'index'

  # GET /attacheds
  # GET /attacheds.json
  def index
    @attacheds = Attached.all
  end

  # GET /attacheds/1
  # GET /attacheds/1.json
  def show
  end

  # GET /attacheds/new
  def new
    @attached = Attached.new
  end

  # GET /attacheds/1/edit
  def edit
  end

  # POST /attacheds
  # POST /attacheds.json
  def create
    @attached = Attached.new(attached_params)

    respond_to do |format|
      if @attached.save
        format.html { redirect_to @attached, notice: 'Attached was successfully created.' }
        format.json { render :show, status: :created, location: @attached }
      else
        format.html { render :new }
        format.json { render json: @attached.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attacheds/1
  # PATCH/PUT /attacheds/1.json
  def update
    respond_to do |format|
      if @attached.update(attached_params)
        format.html { redirect_to @attached, notice: 'Attached was successfully updated.' }
        format.json { render :show, status: :ok, location: @attached }
      else
        format.html { render :edit }
        format.json { render json: @attached.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attacheds/1
  # DELETE /attacheds/1.json
  def destroy
    @attached.file = nil
    @attached.save
    @attached.destroy
    respond_to do |format|
      format.html { redirect_to attacheds_url, notice: 'Attached was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attached
      @attached = Attached.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attached_params
      params.require(:attached).permit(:descripcion, :fecha_subida, :investigation_id, :file)
    end
end
