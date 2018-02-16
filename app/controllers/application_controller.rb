class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            added_attrs = [:name,:last_name, :email, :password, :password_confirmation, :remember_me]
    		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        end

    def authenticate_admin!
     unless current_user.present? && current_user.is_admin?
       flash[:danger] = "No tienes autorización para entrar en esa sección"
       redirect_to root_path
     end
  end


end
