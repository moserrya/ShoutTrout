class InboundMessage < ActiveRecord::Base
  validates_presence_of :from, :to

  belongs_to :user

  before_create NormalizePhoneNumber.new :from
end
