class NotifyContactWorker
  include Sidekiq::Worker
  include PlivoClient

  def perform(user_identity, contact_phone_number)
    message_body = build_message_body(user_identity)
    send_message(contact_phone_number, message_body)
  end

  private
  def build_message_body(user_identity)
    "This is ShoutTrout. We haven't heard from #{user_identity} in #{User::HOURS_TO_RESPOND} hours. Something's fishy! Please reach out to them and make sure they're OK."
  end
end
