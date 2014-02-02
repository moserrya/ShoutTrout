class Contact < ActiveRecord::Base
  include Phone

  belongs_to :user, inverse_of: :contact
  validates_presence_of :user
  validates :phone_number, length: {is: 10}

  before_validation :normalize_phone_number

end
