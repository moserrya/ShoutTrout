class InboundMessage < ActiveRecord::Base
  validates_presence_of :from, :to

  belongs_to :user

  after_initialize NormalizePhoneNumber.new :from
end
