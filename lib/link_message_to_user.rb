class LinkMessageToUser < Struct.new(:message)
  delegate :from, to: :message

  def call
    message.user_id = User.find_by(phone_number: message.from).try(:id)
  end
end
