class RoleController < ApplicationController
layout 'template'
before_action :set_role, only: [:show, :edit, :update,:destroy]

def index
	@roles=Role.all
end

def new
	@role= Role.new
end

def edit
end

def show
end

def create
    @role = Role.new(role_params)
    @role.save
    redirect_to new_user_path
end

def destroy
    Role.find(params[:id]).destroy
    flash[:success] = "Rol deleted"
    redirect_to role_index_path
end
private

def set_role
      @role = Role.find(params[:id])
end
 def role_params
      params.require(:role).permit(:name)
 end
end
