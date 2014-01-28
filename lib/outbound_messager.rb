class OutboundMessager
  include Sidekiq::Worker
  include PlivoClient
end

# pivlo sms url: shouttrout.com/inbound_messages
