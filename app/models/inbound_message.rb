class InboundMessage < ActiveRecord::Base
  validates_presence_of :from, :to

  belongs_to :user

  after_initialize NormalizePhoneNumber.new :from

  scope :most_recent, -> {joins('LEFT OUTER JOIN inbound_messages im ON im.user_id = inbound_messages.user_id AND inbound_messages.id < im.id').where('im.id is null')}
end
