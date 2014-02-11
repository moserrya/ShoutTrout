class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def create
    CreateStripeCustomer.perform_async('user_id', 'token')
  end

  def edit
    
  end

  def update
  end

  def show
  end

  def cancel
    subscription = user.subscription
    subscription.deactivate!
    CancelSubscription(subscription.stripe_customer_token)
  end
end
