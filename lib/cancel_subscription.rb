class CancelSubscription
  include Sidekiq::Worker

  def perform(stripe_customer_token)
    customer = Stripe::Customer.retrieve(stripe_customer_token)
    customer.cancel_subscription({at_period_end: false})
  end
end
