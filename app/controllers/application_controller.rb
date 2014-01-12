class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

private
  def layout_by_resource
    if controller_name == 'pages' && params[:id] == "home"
      "home"                        # Homepage
    elsif devise_controller?
      "sign_up"                     # Sign up & sign in
    else
      "application"                 # Everything else
    end
  end
end
