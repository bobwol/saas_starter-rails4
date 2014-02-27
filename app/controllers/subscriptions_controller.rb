class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subscription, only: [:destroy]
  
  before_filter :load_plans, only: [:index]
  
  # GET /subscriptions
  def index
    @subscriptions = current_user.subscriptions
    @selected = current_user.subscription.plan_id if current_user.subscription
    @subscription = Subscription.new  
  end
  
  # POST /subscriptions
  def create
    active_subscription = current_user.subscription
    
    @subscription = current_user.subscriptions.build(subscription_params)
    
    # Amount (in cents) for Stripe
    @stripe_amount = 100 * @subscription.plan.price
    
    # Get the credit card details submitted by the form
    token = params[:stripeToken]
    
    # Create a Customer
    customer = Stripe::Customer.create(
      :card => token,
      :description => @subscription.user.email
      )
    
    # Charge the Customer instead of the card
    Stripe::Charge.create(
      :amount =>  @stripe_amount,
      :currency => "usd",
      :customer => customer.id
      )
    
    # Save customer's unique Stripe Id for future reference to API
    @subscription.user.stripe_id = customer.id
    @subscription.user.save!
    
    if @subscription.save
      # End the current subscription period in favor of the new one
      if active_subscription
        active_subscription.end_date = Date.today
        active_subscription.save
      end
      
      flash[:success] = "Subscription created succesfully, thank you!"
      redirect_to root_url
    else
      redirect_to subscriptions_path
    end
  end

  # DELETE /subscriptions/1
  def destroy
    flash[:notice] = "You've successfully cancelled your subscription."
    @subscription.end_date = Date.yesterday
    @subscription.save
    redirect_to subscriptions_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:user_id, :plan_id, :last_4, :card_type, :coupon_id, :stripe_card_token)
    end
end
