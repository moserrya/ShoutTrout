class User < ActiveRecord::Base
  include Phone

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :contact, inverse_of: :user
  accepts_nested_attributes_for :contact

  has_many :text_messages

  before_validation :normalize_phone_number

  validates_presence_of :name
  validates :phone_number, length: {is: 10}
end
