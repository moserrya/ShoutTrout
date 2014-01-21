class SMS < ActiveRecord::Base
  include Phone

  before_create :set_user
  belongs_to :user

  private
  def set_user
    self.user_id = User.find_by(phone_number: from).try(:id)
  end
end
