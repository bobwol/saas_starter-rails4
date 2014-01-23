class ApplicationController < ActionController::Base
  include Pundit
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  layout :layout_by_resource

private
  def layout_by_resource
    if controller_name == 'pages' && params[:id] == 'home'
      "home"                        # Homepage
    elsif (controller_name == 'registrations' || controller_name == 'sessions') && (action_name == 'new' || action_name == 'create')
      "sign_up"                     # Sign up & sign in
    else
      "application"                 # Everything else
    end
  end
  
protected
  # Add custom strong params for User Sign Up
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :terms_of_service
  end
end
