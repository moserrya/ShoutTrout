class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :contact, inverse_of: :user
  accepts_nested_attributes_for :contact

  has_many :inbound_messages

  has_one :subscription

  before_validation NormalizePhoneNumber.new :phone_number

  validates :phone_number, length: {is: 12, message: "does not appear to be valid"}
end
