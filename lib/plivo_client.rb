module PlivoClient
  include Plivo

  def send_message(dst, body)
    send_messages [dst], body
  end

  def send_messages(dsts, body)
    dst_list = dsts.join('<')
    status_code, body = plivo.send_message message_params(dst_list, body)
    raise PlivoClientError.new body.to_s, body.response unless status_code.to_s =~ /2\d\d/
    status_code.to_s
  end

  private
  def message_params(dst_list, body)
    { 'src'  => PLIVO_CONFIG[:from],
      'dst'  => dst_list,
      'text' => body,
      'type' => 'sms'}
  end

  def plivo
    @plivo ||= RestAPI.new(PLIVO_CONFIG[:auth_id], PLIVO_CONFIG[:auth_token])
  end
end

class PlivoClientError < StandardError
  attr_accessor :status, :response
  def initialize(status, response)
    @status = status
    @response = response
  end
end
