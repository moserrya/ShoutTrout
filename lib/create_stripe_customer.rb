class CreateStripeCustomer
  include Sidekiq::Worker

  def perform(user_id, stripe_card_token)
    customer = Stripe::Customer.create(description: user.email, plan: 1, card: stripe_card_token)
    user.create_subscription stripe_customer_token: customer.id
  end

  def user
    @user ||= User.find(user_id)
  end
end
