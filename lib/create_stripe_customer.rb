class CreateStripeCustomer
  include Sidekiq::Worker

  def perform(user_id, stripe_card_token)
    user = User.find(user_id)
    customer = Stripe::Customer.create(email: user.email, plan: 1, card: stripe_card_token)
    user.create_subscription stripe_customer_token: customer.id
  end
end
