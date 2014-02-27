class ApplicationController < ActionController::Base
  include Pundit
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  layout :layout_by_resource
  
  def load_plans
    @plans = Plan.order(:price)
  end
  
private
  def layout_by_resource
    if controller_name == 'pages' && params[:id] == 'home'
      "home"                         # Homepage
    elsif devise_controller? && !(controller_name == 'registrations' && action_name == 'edit')
      "sign_up"                      # Sign up, sign in, & forgot password
    elsif controller_name == 'pages' 
      "pages"                        # Static pages
    else
      "dashboard"                    # User dashboard
    end
  end
  
protected
  # Add custom strong params for User Sign Up
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :terms_of_service << :first_name << :last_name
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name
  end
end
