class PagesController < ApplicationController
  include HighVoltage::StaticPage
  
  layout :layout_by_resource #application_controller.rb
end
