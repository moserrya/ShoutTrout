class DailyMessageWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  include PlivoClient

  recurrence {hourly}

  def perform
    send_daily_messages
  end

  private
  def send_daily_messages
    hourly_users = User.active.where(hour_to_send_message: Time.now.hour)
    send_messages(hourly_users.pluck(:phone_number), build_daily_message)
    hourly_users.update_all(last_outbound_message_at: Time.now)
  end

  def build_daily_message
    "Hi, this is #{['Tiny', 'Big', 'Rainbow'].sample} Trout. Happy #{Date::DAYNAMES[DateTime.now.cwday]}! #{['Please let me know that', 'Hope'].sample} you got this. #{['Can\'t wait to hear', 'Looking forward to hearing'].sample} from you #{[':)', ].sample}"
  end
end
