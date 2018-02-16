class HomeController < ApplicationController

layout 'index'

	before_action :authenticate_user!
protect_from_forgery with: :null_session
before_action :authenticate_user!
  def index
  end



    protected

        def configure_permitted_parameters
            added_attrs = [:name,:last_name, :email, :password, :password_confirmation, :remember_me]
    		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        end

end
