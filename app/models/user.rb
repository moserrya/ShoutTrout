class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :subscription, dependent: :nullify
  has_many :inbound_messages

  has_one :last_inbound_message, -> {order('id desc')}, class_name: 'InboundMessage'

  before_validation NormalizePhoneNumber.new :phone_number
  validates :phone_number, length: {is: 12, message: "does not appear to be valid"}

  has_one :contact, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :contact

  delegate :phone_number, :notified?, to: :contact, prefix: true, allow_nil: true

  scope :active, -> {joins(:subscription).merge(Subscription.active)}

  HOURS_TO_RESPOND = 24

  def identity
    name || email
  end

end
