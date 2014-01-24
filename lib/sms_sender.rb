class SMSSender
  include Plivo
  include Sidekiq::Worker
end
