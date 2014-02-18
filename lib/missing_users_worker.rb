class MissingUsersWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence {hourly}

  def perform
    missing_users.find_each do |user|
      NotifyContactWorker.perform_async(user.identity, user.contact_phone_number)
    end
  end

  def missing_users
    User.active.includes(:contact).joins(:inbound_messages).
      group('users.id, inbound_messages.user_id').
      order('inbound_messages.user_id desc').
      having('extract(epoch from users.last_outbound_message_at - max(inbound_messages.created_at)) > (?)', User::HOURS_TO_RESPOND.hours)
  end
end
