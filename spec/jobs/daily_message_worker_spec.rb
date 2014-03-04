require 'spec_helper'

describe DailyMessageWorker do

  it { is_expected.to respond_to(:current_time)}

  context '#perform' do
    let(:job)  { DailyMessageWorker.new }
    let(:client) {PlivoClient}
    let!(:users) do
      3.times.map {create :user_with_subscription, hour_to_send_message: 12, last_outbound_message_at: 22.hours.ago}
    end

    before :each do
      allow(client).to receive(:send_messages)
    end

    context 'users due this hour' do
      before :each do
        def job.current_time
          DateTime.parse("11/11/2014 12:00:01")
        end
      end

      it 'messages all of the users due this hour' do
        expect(client).to receive(:send_messages).with(users.map(&:phone_number), anything).once
        job.perform
      end

      it 'updates the last outbound message to the current time' do
        job.perform
        expect(users.map(&:reload).map(&:last_outbound_message_at)).to match_array([job.current_time] * users.count)
      end
    end

    it 'does not message the users when they are not due' do
      def job.current_time
        DateTime.parse("11/11/2014 13:00:01")
      end
      expect(client).to receive(:send_messages).with([], anything).once
      job.perform
    end
  end
end
