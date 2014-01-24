class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subscription, only: [:destroy]

  # GET /subscriptions
  def index
    @subscriptions = Subscription.where('user_id = ?', current_user)
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
  end

  # POST /subscriptions
  def create
    @subscription = Subscription.new(subscription_params)
    
    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end

  # DELETE /subscriptions/1
  def destroy
    flash[:notice] = "You've successfully cancelled your subscription."
    @subscription.end_date = Date.yesterday
    @subscription.save
    redirect_to new_user_subscription current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:user_id, :plan_id, :start_date, :end_date)
    end
end
