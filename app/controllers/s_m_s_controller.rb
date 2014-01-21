class SMSController < ApplicationController
  def create
    SMS.create text_params
    render xml: "<Response/>"
  end

  # pivlo sms url: shouttrout.com/text_messages/create

  private

  def text_params
    params.deep_transform_keys!(&:underscore).permit(:from, :to, :text, :message_uuid)
  end
end
