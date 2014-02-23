class DailyMessageWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence {hourly}

  # Plivo also has a User class; mixing it in here causes a namespace collision
  def perform
    PlivoClient.send_messages(hourly_users.pluck(:phone_number), message_body)
    hourly_users.update_all(last_outbound_message_at: Time.now)
  end

  private

  def hourly_users
    @hourly_users ||= User.active.where(hour_to_send_message: Time.now.hour)
  end

  def message_body
    message = "Hi, this is #{['Tiny', 'Big', 'Rainbow'].sample} Trout. Happy #{Date::DAYNAMES[DateTime.now.cwday]}! "
    message << "#{['Please let me know that', 'Hope'].sample} you got this. "
    message << "#{['Can\'t wait to hear', 'Looking forward to hearing'].sample} from you #{[':)', 'ᕕ( ᐛ )ᕗ'].sample}"
  end
end
