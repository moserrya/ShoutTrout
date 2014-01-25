class InboundMessagesController < ApplicationController

  def create
    InboundMessage.create inbound_message_params
    render xml: "<Response/>", status: 201
  end

  # pivlo sms url: shouttrout.com/inbound_messages

  private

  def inbound_message_params
    params.deep_transform_keys!(&:underscore).permit(:from, :to, :text, :message_uuid)
  end
end
