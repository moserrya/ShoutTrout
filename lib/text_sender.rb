class TextSender
  include Plivo
  include Sidekiq::Worker

  # plivo = RestAPI.new(PLIVO_CONFIG[:auth_id], PLIVO_CONFIG[:auth_token])

  # params = { 'src' => PLIVO_CONFIG[:from],
  #            'dst' => '17039442823',
  #            'text' => "Hi, this is #{['Tiny', 'Big', 'Rainbow'].sample} Trout. Happy #{Date::DAYNAMES[DateTime.now.cwday]}! #{['Please let me know', 'Hope'].sample} you got this. #{['Can\'t wait to hear', 'Looking forward to hearing'].sample} from you #{[':)'].sample}",
  #            'type' => 'sms'}

  # p.send_message(params)
end
