class LinkMessageToUser < Struct.new(:message)
  delegate :from, to: :message

  def call
    if user = User.find_by(phone_number: message.from)
      message.user_id = user.id
    end
  end
end
