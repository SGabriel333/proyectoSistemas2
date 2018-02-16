class InvestigationsController < ApplicationController
  before_action :set_investigation, only: [:show, :edit, :update, :destroy]
  layout 'template'
  protect_from_forgery with: :null_session, only: [:destroy]
  # GET /investigations
  # GET /investigations.json
  def index
    @rol_id = Role.find_by(:name => params[:param]).id

    @investigations = Investigation.find_by_sql("select * from investigations i
     inner join (select * from users_roles ur where ur.role_id = #{@rol_id}) as ur on i.user_id = ur.user_id")
  end

  # GET /investigations/1
  # GET /investigations/1.json
  def show
    # Obtiene todos los adjuntos con id igual al parametro pasado.
    @attacheds = Attached.where(:investigation_id => params[:id])
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
     Audited.audit_class.as_user(User.find("#{User.current.id}")) do
      @investigation = Investigation.new(investigation_params)
    # Si no existen éstos campos no se guarda y crea un mensaje.
    if !(@investigation.nombre.present?)
      redirect_to request.referrer, notice: 'Complete todos los campos.!'  
    else
      respond_to do |format|
        if @investigation.save
          format.html { redirect_to @investigation, notice: 'Trabajo de investigación creado.' }
          format.json { render :show, status: :created, location: @investigation }
        else
          format.html { render :new }
          format.json { render json: @investigation.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  @investigation.audits.last.user
  end

  # PATCH/PUT /investigations/1
  # PATCH/PUT /investigations/1.json
  def update
      # Si no existen éstos campos no se guarda y crea un mensaje.
      if (!@investigation.nombre.present? or !@investigation.descripcion.present?)
        redirect_to request.referrer, notice: 'Complete todos los campos.!'
      else
        respond_to do |format|
          if @investigation.update(investigation_params)
            format.html { redirect_to @investigation, notice: 'Trabajo de investigación´actualizado.' }
            format.json { render :show, status: :ok, location: @investigation }
          else
            format.html { render :edit }
            format.json { render json: @investigation.errors, status: :unprocessable_entity }
          end
        end
      end  
  end

  # DELETE /investigations/1
  # DELETE /investigations/1.json
  def destroy
      # Redirige al index de investigations.
      Audited.audit_class.as_user(User.find("#{Investigation.current.id}")) do
        respond_to do |format|
      @investigation.destroy
      format.html { redirect_to investigations_url, notice: 'Investigation was successfully destroyed.' }
      format.json { head :no_content }
    end
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
