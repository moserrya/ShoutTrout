require 'spec_helper'

describe MissingUsersWorker do
  let (:missing_count) {3}
  let (:notifier) {NotifyContactWorker}
  let (:job) {MissingUsersWorker.new}
  let (:users) do
    missing_count.times.map do |i|
      user = build_stubbed :user
      build_stubbed :contact, user: user
      user
    end
  end

  before :each do
    allow(job).to receive(:missing_users).and_return(users)
  end

  it 'enqueues a job for each missing user' do
    job.perform
    expect {job.perform}.to change{notifier.jobs.count}.by(missing_count)
  end

  it 'skips enqueueing a job if the contact was already notified' do
    allow(users.last).to receive(:contact_notified?).and_return(true)
    expect {job.perform}.to change{notifier.jobs.count}.by(missing_count - 1)
  end

  it 'enqueues jobs with user identities and contact phone numbers' do
    user = users.first
    allow(job).to receive(:missing_users).and_return([user])
    expect(notifier).to receive(:perform_async).with(user.identity, user.contact_phone_number)
    job.perform
  end
end
