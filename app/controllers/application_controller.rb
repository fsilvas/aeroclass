class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception
  	before_action :authenticate_user!
  	before_action :configure_permitted_parameters, if: :devise_controller? 

  	def current_ability
  	  @current_ability ||= Ability.new(current_user)
  	end


    
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, :notice => "Acceso restringido."
    end


    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:email, :password, :password_confirmation,:current_password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :current_password])
      
    end

end