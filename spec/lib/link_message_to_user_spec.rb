require 'spec_helper'

describe LinkMessageToUser do

  let(:contact) {FactoryGirl.create :contact, notified_at: 6.hours.ago}
  let(:user) { contact.user}
  let(:message) {FactoryGirl.build :inbound_message, from: user.phone_number}

  it 'sets the user_id of the message based on the phone number' do
    expect {
      LinkMessageToUser.new(message).call
    }.to change{message.user_id}.from(nil).to(user.id)
  end

  it 'marks contacts as no longer notified' do
    expect {
      LinkMessageToUser.new(message).call
    }.to change{contact.reload.notified?}.from(true).to(false)
  end
end
