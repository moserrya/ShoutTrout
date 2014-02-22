require 'spec_helper'

describe LinkMessageToUser do

  let(:contact) {create :contact, notified_at: 6.hours.ago}
  let(:user) { contact.user}
  let(:message) {build :inbound_message, from: user.phone_number}

  it 'sets the user_id of the message based on the phone number' do
    expect {
      LinkMessageToUser.new(message).call
    }.to change{message.user_id}.from(nil).to(user.id)
  end

  it 'clears out the notified_at timestamp from the contact' do
    LinkMessageToUser.new(message).call
    expect(contact.reload.notified_at).to be_falsey
  end
end
