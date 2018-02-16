class UsuariosController < ApplicationController
  layout 'template'
   before_action :authenticate_user!
   before_action :set_user, only: [:show, :edit, :update,:destroy, :show_investigator]

  def index
		@users=User.all
    authorize! :read, @user, :message => 'No puede entrar a esta opcion.'

	end
  
  def investigators
    @rol = Role.find_by(:name => params[:param])
    @investigators = User.with_role @rol.name
  end

  def show_investigator
    @rol = params[:param]
    @investigations = Investigation.where(:user_id => params[:id])
  end

  # GET /user/new
  def new
    respond_to do |f|
    @user = User.new
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

  end

  # POST /users
  # POST /users
  def create
    authorize! :create, @user, :message => "No puedes tienes acceso a esta opcion."
    @user = User.new(user_params)
    @user.add_role(params[:role])
    @user.save
    redirect_to usuarios_path, notice: 'Usuario fue creado'
   
   end
 



  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize! :update, @user, :message => "No puedes tienes acceso a esta opcion."
      if @user.is_admin? 
         @user.remove_role :admin
      end
      if @user.is_adminInv?
        @user.remove_role :adminInv  
      end
      if @user.is_adminExt?
        @user.remove_role :adminExt
      end
      if @user.is_investigador?
        @user.remove_role :Investigador
      end
      
      @user.add_role(params[:role])
      @user.update(user_params)
      redirect_to usuarios_path, notice: 'Usuario fue actualizado.'
  end 

  # DELETE Users
  def destroy
   @user.destroy
   redirect_to usuarios_path, notice: 'Usuario fue eliminado.'
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
