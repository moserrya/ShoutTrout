class OutboundMessager
  include Sidekiq::Worker
  include PlivoClient

  def perform
    send_daily_messages
  end

  private
  def send_daily_messages
    User.transaction do
      hourly_users = User.joins(:subscription).merge(Subscription.active).where(hour_to_send_message: DateTime.now.hour)
      send_messages(hourly_users.pluck(:phone_number))
      hourly_users.update_all(last_outbound_message_at: DateTime.now)
    end
  end
end
