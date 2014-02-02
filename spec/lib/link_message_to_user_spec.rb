require 'spec_helper'

describe LinkMessageToUser do

  let(:user)    { OpenStruct.new phone_number: '17039442823', id: 33}
  let(:message) { OpenStruct.new from: user.phone_number }

  before :each do
    User.stub(:find_by).with(phone_number: user.phone_number).and_return(user)
  end

  it 'sets the user_id of the message based on the phone number' do
    expect {
      LinkMessageToUser.new(message).call
    }.to change{message.user_id}.from(nil).to(user.id)
  end
end
