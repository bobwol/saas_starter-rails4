class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_subscription
  
  def index
    #@projects = Project.all
    @user = current_user
  end
  
  private
  def require_subscription
    unless current_user.subscription
      flash[:error] = 'You do not have a current subscription, please choose a plan.'
      redirect_to new_subscription_path
    end
  end
end
