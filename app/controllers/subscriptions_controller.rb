class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def create
    CreateStripeCustomer.perform_async(current_user.id, 'token')
  end

  def edit
    
  end

  def update
  end

  def show
  end

  def cancel
    subscription.deactivate!
    CancelSubscription(subscription.stripe_customer_token)
  end

  private
  def subscription
    @subscription ||= current_user.subscription
  end
end
