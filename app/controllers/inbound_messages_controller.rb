class InboundMessagesController < ApplicationController
  skip_before_filter  :verify_authenticity_token, only: [:create]
  include Plivo

  def create
    message = InboundMessage.create inbound_message_params
    LinkMessageToUser.new(message).call
    render xml: "<Response/>", status: message.persisted? ? 201 : 400
  end

  private

  def inbound_message_params
    params.deep_transform_keys!(&:underscore).permit(:from, :to, :text, :message_uuid)
  end
end
