module PlivoClient
  include Plivo

  def send_message(dst, body)
    send_messages [dst], body
  end

  def send_messages(dsts, body)
    dst_list = dsts.join('<')
    plivo.send_message message_params(dst_list, body)
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
