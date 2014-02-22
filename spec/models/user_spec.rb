require 'spec_helper'

describe User do
  let(:user) {User.new name: 'a', email: 'a@a.com', password: 'password', phone_number: '703-944-2823'}
  it 'validates phone numbers' do
    user.phone_number = '000'
    expect(user.valid?).to be_falsey
  end

  specify 'the name is the users identify if present' do
    expect(user.identity).to eq(user.name)
  end

  specify 'the email is the identity with no name present' do
    user.name = nil
    expect(user.identity).to eq (user.email)
  end
end
