class InboundMessage < ActiveRecord::Base
  include Phone
  validates_presence_of :from, :to

  belongs_to :user

  private
end
