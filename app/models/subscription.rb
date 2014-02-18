class Subscription < ActiveRecord::Base
  belongs_to :user

  scope :active, -> {where(active: true)}

  def deactivate!
    update active: false
  end
end
