class PagesController < ApplicationController
  include HighVoltage::StaticPage
  
  # Figure out what layout to present the page with
  layout :layout_by_resource #application_controller.rb
  
  def show
    if user_signed_in? && params[:id] == 'home'
      # If the user is logged in, don't show the homepage and 
      # instead redirect to the user's dashboard
      redirect_to dashboards_path
    else
      @plans = Plan.all
      # Because of the HighVoltage show action override, we need to
      # repeat the template rendering it did
      render template: current_page
    end
  end
end
