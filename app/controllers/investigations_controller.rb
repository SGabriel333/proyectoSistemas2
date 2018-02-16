class InvestigationsController < ApplicationController
  before_action :set_investigation, only: [:show, :edit, :update, :destroy]
  layout 'template'
  # GET /investigations
  # GET /investigations.json
  def index
    @rol = Role.find_by(:name => params[:param])

    @investigations = Investigation.find_by_sql("select * from investigations i
     inner join (select * from users_roles ur where ur.role_id = #{@rol.id}) as ur on i.user_id = ur.user_id")
  end

  # GET /investigations/1
  # GET /investigations/1.json
  def show
    # Obtiene todos los adjuntos con id igual al parametro pasado.
    @attacheds = Attached.where(:investigation_id => params[:id])
    @rol = params[:param]

  end

  # GET /investigations/new
  def new
    @investigation = Investigation.new
    rol = Role.find(params[:param])
    @users = User.with_role rol.name  
    respond_to do |f|
      f.js
    end
  end

  # GET /investigations/1/edit
  def edit
    rol = Role.find(params[:param])
    @users = User.with_role rol.name
    respond_to do |f|
      f.js
    end
  end

  # POST /investigations
  # POST /investigations.json
  def create
    @investigation = Investigation.new(investigation_params)


    respond_to do |format|
      if @investigation.save
        format.html { redirect_to request.referrer, notice: 'Trabajo de investigación creado.' }
        format.json { render :show, status: :created, location: @investigation }
      else
        format.html { render :new }
        format.json { render json: @investigation.errors, status: :unprocessable_entity }
      end
    end   
  end

  # PATCH/PUT /investigations/1
  # PATCH/PUT /investigations/1.json
  def update  
        respond_to do |format|
          if @investigation.update(investigation_params)
            format.html { redirect_to request.referrer, notice: 'Trabajo de investigación actualizado.' }
            format.json { render :show, status: :ok, location: @investigation }
          else
            format.html { render :edit }
            format.json { render json: @investigation.errors, status: :unprocessable_entity }
          end
        end 

  end

  # DELETE /investigations/1
  # DELETE /investigations/1.json
  def destroy
    @investigation.destroy
    respond_to do |format|
      # Redirige al index de investigations.
      format.html { redirect_to request.referrer, notice: 'Investigación eliminada.' }

      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investigation
      @investigation = Investigation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investigation_params
      params.require(:investigation).permit(:nombre, :descripcion, :fecha_inicio, :fecha_fin, :user_id)
    end
end
