class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :grade ,presence: true

  has_one :user_info
  has_many :posts

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :grade_id
end
