require 'spec_helper'

describe DailyMessageWorker do
  before :all do
    @hour = Time.now.hour
    @user_count = 3
    @users = @user_count.times.map {create :user_with_subscription, hour_to_send_message: @hour, last_outbound_message_at: 22.hours.ago}
  end

  after :all do
    User.destroy_all
  end

  let(:job) {  DailyMessageWorker.new }
  let(:message) { "There's a squid on your head!" }

  before :each do
    allow(Time).to receive(:now).and_return(Time.new(2014, 02, 14, @hour, 00, 00))
    allow(job).to receive(:message_body).and_return(message)
    allow(job).to receive(:send_messages)
  end

  it 'messages all of the users due this hour' do
    expect(job).to receive(:send_messages).with(@users.map(&:phone_number), message).once
    job.perform
  end

  it 'updates the last outbound message to the current time' do
    job.perform
    expect(@users.map(&:reload).map(&:last_outbound_message_at)).to match_array([Time.now] * @user_count)
  end

  it 'does not message the users when they are not due' do
    allow(Time).to receive(:now).and_return(Time.new(2014, 02, 14, @hour + 1, 00, 00))
    expect(job).to receive(:send_messages).with([], message).once
    job.perform
  end
end
