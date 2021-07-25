class Info < ApplicationRecord
  belongs_to :user
  validates :user_name, :password, :confirm_password, :email, :website_name, presence: true
  validates :password, confirmation: true
  before_save :validates_confirm_password?

  def validates_confirm_password?
     return if self.password == self.confirm_password
  end

end
