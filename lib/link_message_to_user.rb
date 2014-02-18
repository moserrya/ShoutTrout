class LinkMessageToUser < Struct.new(:message)
  delegate :contact, to: :user

  def call
    if user = User.includes(:contact).find_by(phone_number: message.from)
      contact.update notified_at: nil if contact.notified?
      message.user = user
    end
  end
end
