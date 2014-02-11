class Subscription < ActiveRecord::Base
  belongs_to :user

  scope :active, -> {where(active: true)}

  def deactivate!
    update_attributes active: false
  end
end
