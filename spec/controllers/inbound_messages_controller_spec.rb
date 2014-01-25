require 'spec_helper'

describe InboundMessagesController do

  describe '#create' do
    let(:params) {{'FROM' => '17039442823', 'TO' => '14049643930', 'TEXT' => 'Tiny Big Message', 'MESSAGE_UUID' => '0haljhf92230hdfaohajh3'}}
    it 'should create a new inbound message' do
      expect {
        post :create, params
      }.to change{InboundMessage.count}.by(1)
    end

  end
end
