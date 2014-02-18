class Contact < ActiveRecord::Base

  belongs_to :user, inverse_of: :contact
  validates_presence_of :user
  validates :phone_number, length: {is: 12}

  before_validation NormalizePhoneNumber.new :phone_number

  def notified?
    !notified_at.nil?
  end

end
