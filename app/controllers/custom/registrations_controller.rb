class Custom::RegistrationsController < Devise::RegistrationsController
  include PlansHelper
  
  def new
    @selected = params[:plan_id].to_i
    @plans = Plan.all
    
    super
  end
  
  def create
    @selected = params[:plan_id].to_i
    @plans = Plan.all
    
    super
  end
end