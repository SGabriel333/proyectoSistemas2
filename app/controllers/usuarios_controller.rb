class UsuariosController < ApplicationController
  layout 'template'
   before_action :authenticate_user!
   before_action :set_user, only: [:show, :edit, :update,:destroy]
   protect_from_forgery with: :null_session, only: [:destroy]

  def index
		@users=User.all
 end
  

  # GET /user/new
  def new
    @user = User.new
    respond_to do |f|
      f.js
    end
  end
# GET /user/
  def show
    respond_to do |format|
        format.js
      end
  end

  # GET /user/1/edit
  def edit
    respond_to do |f|
      f.js
    end
  end

  # POST /users
  # POST /users
  def create
    authorize! :create, @user, :message => "No puedes tienes acceso a esta opcion."
    @user = User.new(user_params)
    @user.add_role(params[:role])
    if @user.save
      redirect_to usuarios_path, notice: 'Usuario fue creado'
    else
      redirect_to usuarios_path, alert: 'Contraseña incorrecta o correo incorrecto'
    end
  end



  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize! :update, @user, :message => "No puedes tienes acceso a esta opcion."
      if @user.is_admin? 
         @user.remove_role :admin
      end
      if @user.is_adminInv?
        @user.remove_role :adminInvestigacion  
      end
      if @user.is_adminExt?
        @user.remove_role :adminExtension
      end
      if @user.is_docenteInvestigador?
        @user.remove_role :docenteInvestigador
      end

      if @user.is_alumnoInvestigador?
        @user.remove_role :alumnoInvestigador
      end
      
      
      @user.add_role(params[:role])
      @user.update(user_params)
      redirect_to usuarios_path, notice: 'Usuario fue actualizado.'
  end 

  # DELETE Users
  def destroy
    Audited.audit_class.as_user(User.find("#{User.current.id}")) do
    if Investigation.where(id: @user.id).empty? 
        @user.destroy
      redirect_to usuarios_path, notice: 'Usuario fue eliminado.'
    else
       redirect_to usuarios_path, alert: 'usuario tiene documentos'
    end
    #@user.audits.last.user
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name,:last_name,:email,:password,:password_confirmation)
    end
end
