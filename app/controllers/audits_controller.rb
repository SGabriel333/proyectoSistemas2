class AuditsController < ApplicationController
	layout 'template'
	before_action :set_user, only: [:show]
	def index
		@audits = Audit.all
	    authorize! :read, @audits, :message => "No puedes tienes acceso a esta opcion."
	end
	def show
		respond_to do |format|
    		format.js
  		end
	end
	
	private 

	 def set_user
      @audit = Audit.find(params[:id])
    end


end
