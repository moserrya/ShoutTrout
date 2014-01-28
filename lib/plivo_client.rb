module PlivoClient
  include Plivo

  def send_message(dst)
    plivo.send_message message_params(dst)
  end

  private

  def message_params(dst)
    { 'src'  => PLIVO_CONFIG[:from],
      'dst'  => dst,
      'text' => "Hi, this is #{['Tiny', 'Big', 'Rainbow'].sample} Trout. Happy #{Date::DAYNAMES[DateTime.now.cwday]}! #{['Please let me know', 'Hope'].sample} you got this. #{['Can\'t wait to hear', 'Looking forward to hearing'].sample} from you #{[':)'].sample}",
      'type' => 'sms'}
  end

  def plivo
    @plivo ||= RestAPI.new(PLIVO_CONFIG[:auth_id], PLIVO_CONFIG[:auth_token])
  end
end
