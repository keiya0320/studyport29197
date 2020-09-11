class UserInfo < ApplicationRecord
  belongs_to :user, optional: true
  validates :subject ,presence: true
end
