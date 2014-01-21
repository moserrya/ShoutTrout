require 'spec_helper'

describe SMSController do
  let(:sms_params) {{"Body"=> "buk a buk message!",  "MessageUUID"=>"asd8676585a78sd5f548a64sd4f64a467sg4g858", ,  "To"=>"7039442823",  "From"=>"5555992673"}}

  describe '#create' do
    it 'stores the incoming text message' do
      expect {
        post :create, sms_params
      }.to change{SMS.count}.by(1)
    end
  end
end
